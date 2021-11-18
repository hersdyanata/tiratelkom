@extends('layouts.app')
@section('header')
    Preview MoM
@endsection
@section('content')
    <style> 
        table{
            color: rgb(0, 0, 0)!important;
            background: #ffffff;
            font-family: arial;
            font-size: 12px;
            border-collapse: collapse;
            width: 50%;
            height: 182px; 
            margin-left: auto; 
            margin-right: auto;
        }

        table, th, td { 
            border: 1px solid rgb(0, 0, 0)!important;
        }

        p {
            font-size: 14px;
            color: rgb(255, 255, 255);
            font-family: arial;
            font-weight: bold;
            text-align: center;
            vertical-align : middle;
        } 

        td{
            height: 10px;
            vertical-align : middle;
            padding: 5px;
        }

        #tdStyle{ 
            background: #E74C3C; 
            color:#FFF;
            text-align: center;
            font-weight: bold;
        }

        .container {
            width: 200px;
            height: 120px;
            border: 0px solid #000000;
        }
        img {
            width: 200px;
            height: 120px;
        }

        label {
            display: block;
            padding-left: 15px;
            text-indent: -15px;
        }

        input {
            width: 13px;
            height: 13px;
            padding: 0;
            margin:0;
            vertical-align: bottom;
            position: relative;
            top: -3px;
            *overflow: hidden;
        }

    </style>

    <table>
        <tbody>
            <tr>
                <td id="tdStyle" style="width: 45.9279%;" colspan="2">
                    <p>MINUTES OF MEETING</p> 
                    <p>Manajemen Review IMS</p> 
                </td>
                <td style="text-align: center;" rowspan="4">
                    <div class="container">
                        <img src="{{ asset('assets') }}/global/images/telkom-regular.png" class="d-none d-sm-block" alt="">
                    </div>
                </td>
            </tr>
            <tr>
                <td style="width: 11.5%;"><strong>Date</strong></td>
                <td>&nbsp;{{$DataMoM->mom_date}}</td>
            </tr>
            <tr>
                <td><strong>Time</strong></td>
                <td>&nbsp;{{$DataMoM->mom_time}}</td>
            </tr>
            <tr>
                <td><strong>Media</strong></td>
                <td>&nbsp;{{$DataMoM->mom_location}}</td>
            </tr>
            <tr>
                <td colspan="3">Meeting Called by : &nbsp;{{$DataMoM->getAttr_user_name()}}</td>
            </tr> 
            <tr>
                <td colspan="3">Type of Meeting : 
                    @foreach ($MstType as $mt)
                        <input type="checkbox" value="{{$mt->type_id}}" id="meeting_{{$mt->type_id}}" name="meeting[{{$mt->type_id}}]" disabled> {{$mt->type_desc}}
                        @isset($DataType)
                            @foreach ($DataType as $dtt)
                                <script>
                                    $('#meeting_{{ $dtt->type_id }}').prop('checked', true);
                                </script>
                            @endforeach
                        @endisset
                    @endforeach
                </td>
            </tr>
            <tr>
                <td colspan="3">Attendees :
                    <ol style="list-style-type: lower-alpha;">
                        @foreach ($DataParticipant as $dtp)
                            <li>{{$dtp->getAttr_user_name()}}</li> 
                        @endforeach
                    </ol>
                </td>
            </tr>
            <tr>
                <td id="tdStyle" colspan="3">Agenda</td>
            </tr>
            <tr>
                <td colspan="3">
                    <ol style="list-style-type: lower-alpha;">
                        @foreach ($DataAgenda as $dta)
                            <li>{{$dta->agenda_desc}}</li> 
                        @endforeach 
                    </ol>
                </td>
            </tr>
           
            <tr>
                <td id="tdStyle" colspan="3"> Discussion</td>
                {{-- @foreach ($data as $item) --}}
                    
                {{-- @endforeach --}}
            </tr>
            <tr>
                <td colspan="3">
                    <ol>
                        @foreach ($DataAgenda as $dta)
                            @inject('mom', 'App\Services\MomService')
                            @php
                                // cara manggil crot dan fungsi di momservice
                                $dtDiscuss = $mom->get_discuss_by_mom_id_agenda($DataMoM->mom_id, $dta->agenda_id);
                            @endphp

                            <li>{{$dta->agenda_desc}}
                                <ol style="list-style-type: lower-alpha;">
                                    @foreach ($dtDiscuss as $dtd)
                                        <li>{{$dtd->discuss_pointer}}</li> 
                                    @endforeach 
                                </ol>
                            </li> 
                            Diskusi:
                            <ol style="list-style-type: lower-alpha;">
                                @foreach ($dtDiscuss as $dtd)
                                    <li>{{$dtd->discuss_assignment}}</li> 
                                @endforeach 
                            </ol>
                            PIC: 
                            <ol style="list-style-type: lower-alpha;">
                                @foreach ($dtDiscuss as $dtd)
                                    <li>{{$dtd->getAttr_uic_code()}}</li> 
                                @endforeach 
                            </ol>
                            <br>
                        @endforeach 
                    </ol>
                </td>
            </tr>
        </tbody>
    </table>
    <p>&nbsp;</p>
    <style type="text/css"> 
        tabCustom { 
            padding-right:88px; 
            padding-left: 88px;
        }
    </style>
    <div class="row">
        <div class="col-lg-12">
            <div class="text-center" id="div_btn_discuss">
                <input type="hidden" readonly id="temp_mom_id" value="{{$DataMoM->mom_id}}">
                <p>
                    <button type="button" class="btn btn-dark btn-sm" id="btn_save_draft" onclick="simpan_data_diskusi()">Save as Draft <i class="icon-file-plus ml-2"></i></button> &ensp;
                    <a class="btn btn-primary btn-sm" id="btn_preview_mom" href="{{ route('mom.edit_mom', $DataMoM->mom_id) }}">Back to Editing <i class="icon-file-eye ml-2"></i></a>
                </p>
                <p>
                    <button type="button" class="btn btn-danger btn-sm" id="btn_discuss" onclick="submit_data_mom()">
                    <tabCustom> Submit MoM <i class="icon-paperplane ml-2"></i> </tabCustom>
                    </button>
                </p>
            </div>
        </div> 
    </div>
@endsection

@section('page_js')
<script>
    $('document').ready(function(){
        $('#btn_save_draft').prop('disabled', true); 
    });

    function submit_data_mom(){
        $.ajax({
            type: "POST",
            url: "{{ route('mom.store_submit_mom') }}",
            data: {
                '_token': "{{ csrf_token() }}",
                'mom_id': $('#temp_mom_id').val(),
            },
            beforeSend: function(){
                small_loader_open('form_discuss');
            },
            success: function (s) {
                small_loader_close('form_discuss');
                window.location.href = "{{ route('dashboard.index') }}";
            },
            complete: function(){
                small_loader_close('form_discuss');
            },
            error: function(e){
                sw_multi_error(e);
            }
        });
    }   
</script>
@endsection