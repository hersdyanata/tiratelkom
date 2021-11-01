<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TraMomModel extends Model
{
    protected $table = 'tra_mom';
    protected $primaryKey = 'mom_id';
    public $timestamps = false;

    protected $fillable = [
        'mom_title',
        'mom_event',
        'mom_date',
        'mom_time',
        'mom_duration',
        'mom_location',
        'mom_notulen_by',
        'mom_called_by',
        'mom_status',
        'mom_created_date',
    ];

    
    public function getAttr_due_date_discuss(){
        $data = $this->hasOne(TraMomDiscussModel::class,'discuss_mom_id','mom_id')->pluck('discuss_due_date')->max();
        return $data;
    }
    
    public function getAttr_priority_discuss(){
        $data = $this->hasOne(TraMomDiscussModel::class,'discuss_mom_id','mom_id')->pluck('discuss_priority')->max();
        
        if ($data == '3') {
            $priority = "High";
        }
        elseif($data == '2'){
            $priority = "Normal";
        }
        else{
            $priority = "Low";
        }

        return $priority;
    }

    public function getAttr_status_discuss(){
        if($this->mom_status == 'O'){
            $status = 'Open';
        }elseif($this->mom_status == 'C'){
            $status = 'Close';
        }else{
            $status = 'Draf';
        }

        return $status;
    }

}
