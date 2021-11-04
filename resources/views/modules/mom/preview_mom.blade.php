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
            @inject('crot', 'App\Services\MomService')
            @php
                // cara manggil crot dan fungsi di momservice
                // $data = $crot->namafungsi_di_momservice;
            @endphp
            <tr>
                <td id="tdStyle" colspan="3"> Discussion</td>
                {{-- @foreach ($data as $item) --}}
                    
                {{-- @endforeach --}}
            </tr>
            <tr>
                <td colspan="3">
                    <ol>
                        <li>..........</li>
                        <li>..........</li>
                        <li>..........</li>
                    </ol>
                </td>
            </tr>
        </tbody>
    </table>
@endsection