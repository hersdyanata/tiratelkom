<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Validation\Rule;

class MomRequest extends FormRequest
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
            'category_id' => 'required',
            'event_title' => 'required',
            'date' => 'required',
            'time' => 'required',
            'duration' => 'required',
            'meeting_called_by' => 'required', 
            // 'email' => [
            //     'required',
            //     Rule::unique('users')->ignore($this->id, 'id')
            // ],
            // 'username' => [
            //     'required',
            //     'max:30',
            //     Rule::unique('users')->ignore($this->id, 'id')
            // ],
        ];
    }

    public function messages(){
        return [
            'category_id.required' => 'Title cannot be empty',
            'event_title.required' => 'Event cannot be empty',
            'date.required' => 'Date cannot be empty',
            'time.required' => 'Time cannot be empty',
            'duration.required' => 'Duration cannot be empty',
            'meeting_called_by.required' => 'Meeting caled by cannot be empty'
            // 'email.required' => 'Email tidak boleh kosong',
            // 'email.unique' => 'Email sudah terdaftar',
            // 'username.required' => 'Username tidak boleh kosong',
            // 'username.max' => 'Username maximal 30 karakter',
            // 'username.unique' => 'Username sudah terdaftar', 
        ];
    }

    protected function failedValidation(Validator $validator){
        throw new HttpResponseException(response()->json([
            'msg_title' => 'Gagal',
            'msg_body' => json_encode($validator->errors())
        ], 422));
    }
}
