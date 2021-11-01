<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TraMomDiscussModel extends Model
{
    protected $table = 'tra_mom_discuss';
    // protected $primaryKey = ['discuss_id','discuss_agenda_id','discuss_mom_id'];
    protected $primaryKey = false;
    public $timestamps = false;

    protected $fillable = [
        'discuss_mom_id',
        'discuss_agenda_id',
        'discuss_pointer',
        'discuss_assignment',
        'discuss_uic_id',
        'discuss_due_date',
        'discuss_priority',
        'discuss_progress',
        'discuss_status',
        'discuss_created_date',
    ];

    public function getAttr_due_date_discuss(){
        // $data = $this->hasOne(TraMomDiscussModel::class,'discuss_mom_id','mom_id')->pluck('discuss_due_date')->max();
        return 'due_date';
    }
    
    public function getAttr_priority_discuss(){
        if($this->discuss_priority == '3'){
            $priority = 'High';
        }elseif($this->discuss_priority == '2'){
            $priority = 'Close';
        }else{
            $priority = 'Low';
        } 

        return max($this->discuss_priority);
    }

    public function getAttr_status_discuss(){
        if($this->discuss_status == 'O'){
            $status = 'Open';
        }elseif($this->discuss_status == 'C'){
            $status = 'Close';
        }else{
            $status = 'Draf';
        }

        return $status;
    }

}