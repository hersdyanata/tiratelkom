<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Validation\Rule;

class AgendaRequest extends FormRequest
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
            //validation for agenda
            'mom_agenda' => 'required',   
        ];
    }

    public function messages(){
        return [
            //validation for agenda
            'mom_agenda.required' => 'Agenda cannot be empty'  
        ];
    }

    protected function failedValidation(Validator $validator){
        throw new HttpResponseException(response()->json([
            'msg_title' => 'Failed',
            'msg_body' => json_encode($validator->errors())
        ], 422));
    }
}
