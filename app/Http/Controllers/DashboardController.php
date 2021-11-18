<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\TraMomModel as MomHeader;
use App\Models\MomCategoryModel as Kategori;
use App\Models\TraMomDiscussModel as Discuss;
use App\Models\MstUICModel as UIC;

use App\Services\DashboardService;

class DashboardController extends Controller
{
    public function __construct()
    {
        $this->middleware(['auth', 'granted', 'verified']);
    }

    public function index(){
        return view('modules.dashboard.index')
                ->with([
                    'title' => 'Dashboard',
                ]);
    }

    public function extended_page(Request $r){
        if($r->type == 'L'){
            $view = $this->list_assignment('L');
        }elseif($r->type == 'A'){
            $view = $this->all_mom('A');
        }elseif($r->type == 'O'){
            $view = $this->open_mom('O');
        }elseif($r->type == 'C'){
            $view = $this->closed_mom('C');
        }else{
            $view = $this->mom_per_assignment($r->type);
        }

        return response()->json($view, 200);
    }

    public function list_assignment($post){
        $view = view('modules.dashboard.list_assignment')
                ->with([
                    'title' => 'List Assignment Unit',
                    'uic' => UIC::all(),
                ])
                ->render();

        return $view;
    }

    public function all_mom($status){
        $view = view('modules.dashboard.extended_page')
                ->with([
                    'title' => 'List All MoM',
                    'kategori' => Kategori::all(),
                    'status' => $status,
                    'visible' => "unhidden",
                ])
                ->render();

        return $view;
    }

    public function open_mom($status){
        $view = view('modules.dashboard.extended_page')
                ->with([
                    'title' => 'List Open MoM',
                    'kategori' => Kategori::all(),
                    'status' => $status,
                    'visible' => "unhidden",
                ])
                ->render();

        return $view;
    }

    public function closed_mom($status){
        $view = view('modules.dashboard.extended_page')
                ->with([
                    'title' => 'List Closed MoM',
                    'kategori' => Kategori::all(),
                    'status' => $status,
                    'visible' => "unhidden",
                ])
                ->render();

        return $view;
    }

    public function mom_per_assignment($status){
        $uic_code = UIC::where('uic_id', $status)->pluck('uic_code')->first();
        $view = view('modules.dashboard.extended_page')
                ->with([
                    'title' => 'List Assignment ('.$uic_code.')',
                    'kategori' => Kategori::all(),
                    'status' => $status,
                    'visible' => "hidden",
                ])
                ->render();

        return $view;
    }


    public function filter_mom(DashboardService $Dashboard, Request $r){
        if($r->status_mom == 'L' or $r->status_mom == 'O' or $r->status_mom == 'C'){
            $data = $Dashboard->get_mom_by_category_and_status($r->kategori_mom, $r->status_mom);
        }elseif($r->status_mom == 'A'){
            $data = $Dashboard->get_mom_by_category($r->kategori_mom);
        }else{
            $data = Discuss::where([
                'discuss_uic_id' => $r->status_mom
            ])->get();   
        }

        $table = view('modules.dashboard.table_mom')
                ->with([
                    'moms' => $data
                ])->render();

        return response()->json($table, 200);
    }

}
