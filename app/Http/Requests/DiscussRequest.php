<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Validation\Rule;

class DiscussRequest extends FormRequest
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
            'pointer' => 'required|array|min:1',
            'assignment' => 'required|array|min:1',
            'uic' => 'required|array|min:1',
            'due_date' => 'required|array|min:1',
            'priority' => 'required|array|min:1',
            'status' => 'required|array|min:1',
        ];
    }

    public function messages(){
        return [
            'pointer.required' => 'Pointer cannot be empty',
            'assignment.required' => 'Assignment cannot be empty',
            'uic.required' => 'UIC cannot be empty',
            'due_date.required' => 'Due date cannot be empty',
            'priority.required' => 'Priority cannot be empty',
            'status.required' => 'Status cannot be empty' 
        ];
    }

    protected function failedValidation(Validator $validator){
        throw new HttpResponseException(response()->json([
            'msg_title' => 'Failed',
            'msg_body' => json_encode($validator->errors())
        ], 422));
    }
}
