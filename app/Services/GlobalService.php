<?php

namespace App\Services;

use DB;
use Illuminate\Support\Collection;
use Illuminate\Support\Arr;
use Illuminate\Http\Request;

use App\Models\MomCategoryModel as MoMCategory;
use App\Models\User as MoMUser;
use App\Models\TraMomAgendaModel as MomAgendaItem;

class GlobalService{

    public function get_category_mom(){
        $data = MoMCategory::all();

        $options = '<option value="">-- Forum --</option>';
        foreach($data as $r){
            $options .= '<option value="'.$r->category_id.'">'.ucwords(strtolower($r->category_desc)).'</option>';
        }

        return $options;
    }

    public function get_meeting_called_by(){
        $data = MoMUser::all();

        $options = '<option value="">-- Meeting Called By --</option>';
        foreach($data as $r){
            $options .= '<option value="'.$r->id.'">'.ucwords(strtolower($r->name)).'</option>';
        }

        return $options;
    }

    public function get_discuss_konten($id){
        $data = MomAgendaItem::where('mom_id', $id)->get();
        return $data;
    }
}