<?php

namespace App\Services;

use DB;
use Illuminate\Support\Collection;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\App;
use Illuminate\Http\Request;

use App\Models\TraMomModel as MomHeader;
use App\Models\TraMomTypeModel as MomTypeItem;
use App\Models\TraMomParticipantModel as MomParticipantItem;
use App\Models\TraMomAgendaModel as MomAgendaItem;
use App\Models\TraMomDiscussModel as MomDiscussItem;
use App\Models\TraMomProgressModel as MomProgressItem;
use App\Models\MstUICModel as MasterUIC;

class DashboardService{

    protected $q_dashboard;

    public function __construct(){
        $this->q_dashboard = MasterUIC::leftJoin('tra_mom_discuss', 'discuss_uic_id', 'uic_id')
                                      ->leftJoin('tra_mom', 'mom_id', 'discuss_mom_id'); 
    }
    
    public function get_mom_all(){
        $data = MomHeader::all();
        return $data;
    }

    public function get_mom_by_category($CategoryID){
        $data = MomHeader::where('mom_title', $CategoryID)->get();
        return $data;
    }

    public function get_mom_by_category_and_status($CategoryID, $Status){
        $data = MomHeader::where(['mom_title' => $CategoryID, 
                                  'mom_status' => $Status
                                ])->get();
        return $data;
    }

    public function get_mom_by_uic($id){
        $data = $this->q_dashboard->where('discuss_uic_id', $id)->get();
        return $data;
    }

    public function get_assignment_per_uic(){
        $data = $this->q_dashboard->selectRaw('count(discuss_id) as total_discuss_per_uic, uic_id, uic_code')
                                  ->groupby('uic_id', 'uic_code')
                                  ->get();
 
        return $data;
    }

    public function get_assignment_per_status($uic_id, $status){
        $data = $this->q_dashboard->selectRaw('count(discuss_id) as total_discuss_per_status, uic_id, uic_code, discuss_status')
                                  ->groupby('uic_id', 'uic_code', 'discuss_status')
                                  ->get();
 
        return $data;
    }

}

// select uic_id, uic_code, count(discuss_id) total_discuss_per_uic
//   from master_uic
//   left join tra_mom_discuss on discuss_uic_id = uic_id
// group by uic_id, uic_code;


// select uic_id, uic_code, discuss_status, count(discuss_id) total_discuss_per_status
//   from master_uic
//   left join tra_mom_discuss on discuss_uic_id = uic_id
// group by uic_id, uic_code, discuss_status;

 

// select uic_id, uic_code, count(discuss_id) total_discuss_per_status
//   from master_uic
//   left join tra_mom_discuss on discuss_uic_id = uic_id
// 	left join tra_mom on mom_id = discuss_mom_id
// group by uic_id, uic_code; 