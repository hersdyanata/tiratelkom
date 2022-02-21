<?php

namespace App\Http\Requests\Auth;

use Illuminate\Auth\Events\Lockout;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\RateLimiter;
use Illuminate\Support\Str;
use Illuminate\Validation\ValidationException;
use GuzzleHttp\Client;
use App\Models\User;

class LoginRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'username' => 'required',
            // 'email' => 'required|string|email',
            'password' => 'required|string',
        ];
    }

    /**
     * Attempt to authenticate the request's credentials.
     *
     * @return void
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    public function authenticate()
    {
        $this->ensureIsNotRateLimited();

        // if (! Auth::attempt($this->only('email', 'password'), $this->boolean('remember'))) {
        //     RateLimiter::hit($this->throttleKey());

        //     throw ValidationException::withMessages([
        //         'email' => __('auth.failed'),
        //     ]);
        // }
        $url = config('app.api_ldap');

        $client = new Client(); 
        $response = $client->GET('https://auth.proman.id/services/auth?username='.$this->username.'&password='.$this->password.'');
        $data_json = json_decode($response->getBody()->getContents());
        // echo $data_json->login;
        // die;

        if ($data_json->login == '0'){
            $user = User::where('nik', $this->username)->pluck('id')->first();
            if (!Auth::loginUsingId($user)) {
                throw ValidationException::withMessages([
                    $this->username() => __('auth.failed'),
                ]);
            };
            // if (! Auth::attempt($this->only($this->username(), 'password'), $this->boolean('remember'))) {
            //     RateLimiter::hit($this->throttleKey());
    
            //     throw ValidationException::withMessages([
            //         $this->username() => __('auth.failed'),
            //     ]);
            // }
    
            // RateLimiter::clear($this->throttleKey());          
            
        }else{
            throw ValidationException::withMessages([
                $this->username() => __('auth.failed'),
            ]);
        }
    }

    /**
     * Ensure the login request is not rate limited.
     *
     * @return void
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    public function ensureIsNotRateLimited()
    {
        if (! RateLimiter::tooManyAttempts($this->throttleKey(), 5)) {
            return;
        }

        event(new Lockout($this));

        $seconds = RateLimiter::availableIn($this->throttleKey());

        throw ValidationException::withMessages([
            $this->username() => trans('auth.throttle', [
                'seconds' => $seconds,
                'minutes' => ceil($seconds / 60),
            ]),
        ]);
    }

    /**
     * Get the rate limiting throttle key for the request.
     *
     * @return string
     */
    public function throttleKey()
    {
        return Str::lower($this->input( $this->username())).'|'.$this->ip();
    }

    /**
     * Get the login username to be used by the controller.
     *
     * @return string
     */
    public function username()
    {
        return 'email';
    }
}
