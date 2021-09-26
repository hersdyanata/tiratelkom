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

class MomService{
    public function create_mom($post){
        // simpan transaksi mom header 
        $header = [
            'mom_title'         => $post['category_id'],
            'mom_event'         => $post['event_title'],
            'mom_date'          => date('Y-m-d', strtotime($post['date'])),
            'mom_time'          => $post['time'],
            'mom_duration'      => $post['duration'],
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
        $explode_id = array_map('intval', explode(',', $post['participant_id']));
        $item2 = array();
        if (isset($id_header)) {
            foreach ($explode_id as $dt2 => $r2) {
                if ($r2 != null or $r2 = '') {
                    $item2[] = array(
                        'mom_id'  => $id_header,
                        'user_id' => $r2
                    );
                }
            }
        }
        MomParticipantItem :: insert($item2);


        // $pesan = 'Mom telah dibuat, silahkan lanjut ke tahap selanjutnya.';
        // return $pesan;

        echo json_encode($id_header);
    }

    public function create_mom_agenda($post){
        // simpan detail transaksi mom agenda
        $item = array();
        if (isset($post)) {
            foreach ($post['meeting'] as $dt1 => $r1) {
                if ($r1 != null or $r1 = '') {
                    $item[] = array(
                        'mom_id'  => $id_header,
                        'type_id' => $r1
                    );
                }
            }
        }
        MomTypeItem :: insert($item);

         

        echo json_encode($id_header);
    }
}