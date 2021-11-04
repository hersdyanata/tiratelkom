<?php

namespace App\Services;

use DB;
use Illuminate\Support\Collection;
use Illuminate\Support\Arr;
use Illuminate\Http\Request;

use App\Models\MomCategoryModel as MoMCategory;

class GlobalService{

    public function get_category_mom(){
        $data = MoMCategory::all();

        $options = '<option value="">-- Pilih Provinsi --</option>';
        foreach($data as $r){
            $options .= '<option value="'.$r->category_id.'">'.ucwords(strtolower($r->category_desc)).'</option>';
        }

        return $options;
    }
}