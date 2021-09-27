<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TraMomAgendaModel extends Model
{
    protected $table = 'tra_mom_agenda';
    protected $primaryKey = ['mom_id', 'agenda_id'];
    public $timestamps = false;

    protected $fillable = [
        'mom_id',
        'agenda_id',
        'agenda_desc',
    ];
}
