<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Validation\Rule;

class UserRequest extends FormRequest
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
            'name' => 'required',
            'uic_id' => 'required',
            'nik' => [
                'required',
                'max:6',
                Rule::unique('users')->ignore($this->id, 'id')
            ],
            'group_id' => 'required',
            'password' => 'required',
        ];
    }

    public function messages(){
        return [
            'name.required' => 'Nama tidak boleh kosong',
            'uic_id.required' => 'UIC tidak boleh kosong', 
            'nik.required' => 'NIK tidak boleh kosong',
            'nik.max' => 'NIK maximal 6 karakter',
            'nik.unique' => 'NIK sudah terdaftar',
            'group_id.required' => 'Group tidak boleh kosong',
            'password.required' => 'Password tidak boleh kosong'
        ];
    }

    protected function failedValidation(Validator $validator){
        throw new HttpResponseException(response()->json([
            'msg_title' => 'Gagal',
            'msg_body' => json_encode($validator->errors())
        ], 422));
    }
}
