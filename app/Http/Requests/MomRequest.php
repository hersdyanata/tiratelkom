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
            'unit' => 'required',
            'location' => 'required',
            'meeting_called_by' => 'required', 
            'participant_id' => 'required', 
            'meeting' => 'required|array|min:1',   
        ];
    }

    public function messages(){
        return [
            'category_id.required' => 'Title cannot be empty',
            'event_title.required' => 'Event cannot be empty',
            'date.required' => 'Date cannot be empty',
            'time.required' => 'Time cannot be empty',
            'duration.required' => 'Duration cannot be empty',
            'unit.required' => 'Unit cannot be empty',
            'location.required' => 'Location cannot be empty',
            'meeting_called_by.required' => 'Meeting called by cannot be empty',
            'meeting.required' => 'Type of meeting cannot be empty',
            'participant_id.required' => 'Participant cannot be empty',  
        ];
    }

    protected function failedValidation(Validator $validator){
        throw new HttpResponseException(response()->json([
            'msg_title' => 'Failed',
            'msg_body' => json_encode($validator->errors())
        ], 422));
    }
}
