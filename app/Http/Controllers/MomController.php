<?php

namespace App\Http\Controllers;
use App\Models\MomTypeModel as momType;
use App\Models\MomCategoryModel as momCategory;

use Illuminate\Http\Request;
use App\Services\Core;
use App\Services\MomService;

class MomController extends Controller
{
    public $core;
    public $privileges;
    public function __construct(Core $core){
        $this->middleware(['auth', 'granted']);
        
        $this->core = $core;
    }

    public function index()
    {
        $title = 'Create MoM';
        return view('modules.mom.create')
                ->with([
                    'title' => $title,
                    'dataType' => momType::get(),
                    'dataCategory' => momCategory::get(),
                ]);
    }

    public function store(MomService $mom, Request $request)
    {
        $res = $mom->create_mom($request->all());
        return response()->json($res, 200);
    }

    public function store_agenda(MomService $mom, Request $request)
    {
        // dd($request->all());
        $res = $mom->create_mom_agenda($request->all());
        return response()->json($res, 200);
    }


    public function edit($id)
    {
        //
    }


    public function update(Request $request, $id)
    {
        //
    }

    public function destroy($id)
    {
        //
    }
}