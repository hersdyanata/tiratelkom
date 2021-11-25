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

class MomService{
    public function create_mom($post){
        // simpan transaksi mom header 
        $header = [
            'mom_title'         => $post['category_id'],
            'mom_event'         => $post['event_title'],
            'mom_date'          => date('Y-m-d', strtotime($post['date'])),
            'mom_time'          => $post['time'],
            'mom_duration'      => $post['duration'],
            'mom_unit'          => $post['unit'],
            'mom_location'      => $post['location'],
            'mom_notulen_by'    => session('user_id'),
            'mom_called_by'     => $post['meeting_called_by'],
            'mom_status'        => 'D',
            'mom_created_date'  => Now(), 
        ];

        $id_header = MomHeader::insertGetId($header);

        // simpan detail transaksi mom type item
        $item1 = array();
        if (isset($id_header)) {
            foreach ($post['meeting'] as $dt1 => $r1) {
                if ($r1 != null or $r1 = '') {
                    $item1[] = array(
                        'mom_id'  => $id_header,
                        'type_id' => $r1
                    );
                }
            }
        }
        MomTypeItem :: insert($item1);

        // simpan detail transaksi mom participant
        // $explode_id = array_map('intval', explode(',', $post['participant_id']));
        $item2 = array();
        if (isset($id_header)) {
            foreach ($post['participant_id'] as $dt2 => $r2) {
                if ($r2 != null or $r2 = '') {
                    $item2[] = array(
                        'mom_id'  => $id_header,
                        'user_id' => $r2
                    );
                }
            }
        }
        MomParticipantItem :: insert($item2);

        return $id_header;
    }

    public function create_mom_agenda($post){
        // simpan detail transaksi mom agenda
        $item = array();
        $no = 0;
        if (isset($post)) {
            foreach ($post['mom_agenda'] as $dt => $r) {
                $no++;
                if ($r != null or $r = '') {
                    $item[] = array(
                        'mom_id'  => $post['agenda_mom_id'],
                        'agenda_id' => $no,//$dt,
                        'agenda_desc' => $r
                    );
                }
            }
        }

        $agenda = MomAgendaItem :: insert($item);

        return $item;
    }

    public function create_draft_mom($post){
        $item = array();
        foreach($post['pointer'] as $i => $r){
            $item[] = [
                'discuss_mom_id'        => $post['mom_id'][$i],
                'discuss_agenda_id'     => $post['agenda_id'][$i],
                'discuss_pointer'       => $post['pointer'][$i],
                'discuss_assignment'    => $post['assignment'][$i],
                'discuss_uic_id'        => $post['uic'][$i],
                'discuss_due_date'      => date('Y-m-d', strtotime($post['due_date'][$i])),
                'discuss_priority'      => $post['priority'][$i],
                'discuss_status'        => $post['status'][$i],
                'discuss_created_date'  => Now(), 
            ];
        }

        $diskusi = MomDiscussItem :: insert($item);

        return $diskusi;
    }

    public function submit_mom($post){
        // isi mom_status dengan huruf 'O' yang artinya mom ini telah di publish
        $put = MomHeader::find($post['mom_id']); 
        $put->mom_status = 'O';
        $put->save();

        $pesan = 'MoM telah dibuka.';
        return $pesan;
    }

    public function update_mom($post){
        // simpan transaksi mom header  
        $put = MomHeader::find($post['temp_edit_mom_id']); 
        $put->mom_title         = $post['category_id'];
        $put->mom_event         = $post['event_title'];
        $put->mom_date          = date('Y-m-d', strtotime($post['date']));
        $put->mom_time          = $post['time'];
        $put->mom_duration      = $post['duration'];
        $put->mom_unit          = $post['unit'];
        $put->mom_location      = $post['location'];
        $put->mom_notulen_by    = session('user_id');
        $put->mom_called_by     = $post['meeting_called_by'];
        $put->mom_status        = 'D';
        $put->save();

        DB::table('tra_mom_type')->where('mom_id',$post['temp_edit_mom_id'])->delete();
        DB::table('tra_mom_participant')->where('mom_id',$post['temp_edit_mom_id'])->delete();

        // simpan detail transaksi mom type item
        $item1 = array();
        if (isset($post['temp_edit_mom_id'])) {
            foreach ($post['meeting'] as $dt1 => $r1) {
                if ($r1 != null or $r1 = '') {
                    $item1[] = array(
                        'mom_id'  => $post['temp_edit_mom_id'],
                        'type_id' => $r1
                    );
                }
            }
        }
        MomTypeItem :: insert($item1);

        // simpan detail transaksi mom participant
        $item2 = array();
        if (isset($post['temp_edit_mom_id'])) {
            foreach ($post['participant_id'] as $dt2 => $r2) {
                if ($r2 != null or $r2 = '') {
                    $item2[] = array(
                        'mom_id'  => $post['temp_edit_mom_id'],
                        'user_id' => $r2
                    );
                }
            }
        }
        MomParticipantItem :: insert($item2);

        return $post['temp_edit_mom_id'];
    }

    public function update_agenda($post){
        DB::table('tra_mom_agenda')->where('mom_id',$post['agenda_mom_id'])->delete(); 
        DB::table('tra_mom_discuss')->where('discuss_mom_id',$post['agenda_mom_id'])->delete(); 

        $item = array();
        $no = 0;
        if (isset($post)) {
            foreach ($post['mom_agenda'] as $dt => $r) {
                $no++;
                if ($r != null or $r = '') {
                    $item[] = array(
                        'mom_id'  => $post['agenda_mom_id'],
                        'agenda_id' => $no, 
                        'agenda_desc' => $r
                    );
                }
            }
        }

        $agenda = MomAgendaItem :: insert($item);

        return $agenda;
    }
    
    public function create_progress($post){
        $progress = [
            'progress_mom_id'       => $post['mom_id'],
            'progress_agenda_id'    => $post['agenda_id'],
            'progress_discuss_id'   => $post['discuss_id'],
            'progress_date'         => date('Y-m-d', strtotime($post['prog_date'])),
            'progress_desc'         => $post['prog_desc']
        ];
        
        $progress_id = MomProgressItem :: insertGetId($progress);
        
        return $progress_id;
    }
    
    public function update_status_mom($post){
        //update status diskusi 
        if (isset($post)) {
            foreach ($post['discuss_id'] as $dt => $r) {
                 if ($r != null or $r = '') { 
                     MomDiscussItem::where([
                                        'discuss_mom_id' => $post['mom_id'][$dt],
                                        'discuss_agenda_id' => $post['agenda_id'][$dt],
                                        'discuss_id'=> $post['discuss_id'][$dt]
                                        ]) 
                                    ->update([
                                        'discuss_status' => $post['status'][$dt]
                                            ]);
                }
            }
        } 

        $Item1 = MomDiscussItem::where(['discuss_mom_id' => $post['mom_id'],
                                        'discuss_status' => 'O'
                                       ])
                                 ->count();
        
        //update status mom dimana jika semua diskusi close maka mom menjadi close, apbila diksusi masih ada yang open maka mom masih open
        if ($Item1 == 0) {
            MomHeader::where(['mom_id' => $post['mom_id']]) 
                     ->update(['mom_status' => 'C']);
        }    

        // return $item;
    }

    //--------------------------------------------------------------------------------------------------------------------------------------------
    //--------------------------------------------------------------------------------------------------------------------------------------------
    //Function for load or get data
    public function load_right_sidebar(){
        $data = MomDiscussItem::where([
            'discuss_uic_id' => session('uic_id'),
            'discuss_status' => 'O'
        ])->get();
         
        return $data; 
    }

    public function get_mom_by_mom_id($id){
        $data = MomHeader::find($id);
        return $data;
    }

    public function get_type_by_mom_id($id){
        $data = MomTypeItem::where('mom_id', $id)->get();
        return $data;
    }

    public function get_participant_by_mom_id($id){
        $data = MomParticipantItem::where('mom_id', $id)->get();
        return $data;
    }

    public function get_agenda_by_mom_id($id){
        $data = MomAgendaItem::where('mom_id', $id)->get();
        return $data;
    }

    public function get_discuss_by_mom_id($id){
        $data = MomDiscussItem::where('discuss_mom_id', $id)->get();
        return $data;
    }    

    public function get_discuss_by_mom_id_agenda($mom_id, $agenda_id){
        $data = MomDiscussItem::where(['discuss_mom_id' => $mom_id,
                                       'discuss_agenda_id' => $agenda_id ])->get();
        return $data;
    } 

    public function get_progress_by_mom_agenda_discuss_id($mom_id, $agenda_id, $discuss_id){
        $data = MomProgressItem::where(['progress_mom_id' => $mom_id,
                                        'progress_agenda_id' => $agenda_id,
                                        'progress_discuss_id' => $discuss_id
                                       ])->get();
        return $data;
    } 
}