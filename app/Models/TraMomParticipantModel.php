<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TraMomParticipantModel extends Model
{
    protected $table = 'tra_mom_participant';
    protected $primaryKey = false;//['mom_id', 'uic_id'];
    public $timestamps = false;

    protected $fillable = [
        'mom_id',
        'user_id', 
    ];

    public function getAttr_user_name(){
        $rel = $this->hasOne(User::class,'id','user_id')->first();
        return $rel->getAttr_nama();
    }
}
