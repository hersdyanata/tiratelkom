<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TraMomParticipantModel extends Model
{
    protected $table = 'tra_mom_participant';
    protected $primaryKey = ['mom_id', 'user_id'];
    public $timestamps = false;

    protected $fillable = [
        'mom_id',
        'user_id', 
    ];
}
