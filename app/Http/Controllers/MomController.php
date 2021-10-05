<?php

namespace App\Http\Controllers;
use App\Models\MomTypeModel as momType;
use App\Models\MomCategoryModel as momCategory;

use Illuminate\Http\Request;
use App\Services\Core;
use App\Services\MomService;

use App\Models\TraMomAgendaModel as MomAgendaItem;

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

    public function store_agenda(MomService $mom, Request $request){
        $res = $mom->create_mom_agenda($request->all());

        $agenda = MomAgendaItem::where('mom_id', $request->agenda_mom_id)->get();
        $view_diskusi = view('modules.mom.table_diskusi')->with('agenda', $agenda)->render();
        return response()->json($view_diskusi, 200);
    }

    public function add_row_poin(Request $request){
        // dd($request->all());
        $row = view('modules.mom.row_poin')->with('agenda', $request)->render();;
        return response()->json($row, 200);
    }

    public function create_draft_mom(MomService $mom, Request $request){
        $agenda = array();
        foreach($request->pointer as $i => $r){
            $agenda[] = [
                'mom_id' => $request->mom_id[$i],
                'agenda_id' => $request->agenda_id[$i],
                'pointer' => $request->pointer[$i],
                'assignment' => $request->assignment[$i],
                'uic' => $request->uic[$i],
                'due_date' => $request->due_date[$i],
                'priority' => $request->priority[$i],
                'status' => $request->status[$i]
            ];
        }

        dd($agenda);
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