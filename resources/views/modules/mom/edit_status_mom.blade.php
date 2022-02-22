@extends('layouts.app')
@section('header')
    MoM Review [Notulen Edit]
@endsection
@section('content')
    <div class="row">
        <div class="col-xl-12">
            <div class="card" id="section_divider">
                <div class="card-header header-elements-inline">
                    <h5 class="card-title">{{ $title }}</h5>
                </div>
                
                <div class="header-elements d-none">
                    <div class="d-flex justify-content-center">
                        <a href="#" class="btn btn-link btn-float text-body"><i class="icon-bars-alt text-primary"></i><span>Statistics</span></a> 
                    </div>
                </div>

                <div class="card-body">
                    <form id="form_data">
                        @csrf
                        <div class="row">
                            <div class="col-lg-12">
                                <fieldset> 
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-group">
                                                <label class="font-weight-semibold">Title</label>
                                                <select class="form-control select input_mom" name="category_id" id="category_id">
                                                    <option value="">-- Forum --</option> 
                                                </select>
                                            </div>
                                        </div> 
                                    </div> 

                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-group"> 
                                                <input type="text" placeholder="Event Title" class="form-control input_mom" name="event_title" id="event_title" value="{{ $DataMoM->mom_event }}">
                                            </div>
                                        </div> 
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-4">
                                            <div class="form-group">
                                                <label class="font-weight-semibold">Date</label>
                                                <div class="form-group form-group-feedback form-group-feedback-right">
                                                    <input type="text" placeholder="Set Date" class="form-control daterange-single input_mom" name="date" id="date" value="{{ date("m/d/Y", strtotime($DataMoM->mom_date)) }}">
                                                    <div class="form-control-feedback">
                                                        <i class="icon-calendar22 text-muted"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-lg-4">
                                            <div class="form-group">
                                                <label class="font-weight-semibold">Time</label>
                                                <div class="form-group">
                                                    <input type="time" placeholder="Set Time" class="form-control input_mom" name="time" id="time" value="{{ $DataMoM->mom_time }}">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-lg-2">
                                            <div class="form-group">
                                                <label class="font-weight-semibold">Duration</label>
                                                <input type="number" placeholder="Set Duration" class="form-control input_mom" name="duration" id="duration" min=0 value="{{ $DataMoM->mom_duration }}">
                                            </div>
                                        </div>

                                        <div class="col-lg-2">
                                            <div class="form-group">
                                                <label class="font-weight-semibold">Unit</label>
                                                <input type="text" placeholder="Second/Hour" class="form-control input_mom" name="unit" id="unit" value="{{ $DataMoM->mom_unit }}">
                                            </div>
                                        </div>

                                    </div>

                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-group">
                                                <label class="font-weight-semibold">Location</label>
                                                <input type="text" placeholder="Location" class="form-control input_mom" name="location" id="location" value="{{ $DataMoM->mom_location }}">
                                            </div>
                                        </div> 
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-group">
                                                <label class="font-weight-semibold">Meeting Called By</label>
                                                <select class="form-control select-search input_mom" name="meeting_called_by" id="meeting_called_by">
                                                    <option value="">-- Choose --</option> 
                                                </select>
                                            </div>
                                        </div> 
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-group">
                                                <p class="font-weight-semibold">Type of Meeting</p>
                                                <div class="border p-3 rounded">
                                                    @foreach ($MstType as $mt)   
                                                        <div class="form-check form-check-inline">
                                                            <input type="checkbox" class="form-check-input input_mom" value="{{$mt->type_id}}" id="meeting_{{$mt->type_id}}" name="meeting[{{$mt->type_id}}]">
                                                            <label class="form-check-label" for="meeting_{{$mt->type_id}}">{{$mt->type_desc}}</label>
                                                        </div> 
                                                        @isset($DataType)
                                                            @foreach ($DataType as $dtt)
                                                                <script>
                                                                    $('#meeting_{{ $dtt->type_id }}').prop('checked', true);
                                                                </script>
                                                            @endforeach
                                                        @endisset
                                                    @endforeach 
                                                    

                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-12"> 
                                            <div class="form-group">
                                                <label>Participant</label>
                                                <select multiple="multiple" class="form-control select input_mom" data-fouc data-container-css-class="select2-filled" id="participant_id" name="participant_id[]">
                                                    @foreach ($users as $r)
                                                        @php
                                                            $crot = collect($DataParticipant)->where('user_id', $r->id)->pluck('user_id')->first();
                                                        @endphp
                                                        <option value="{{ $r->id }}" {{ ($crot != '') ? 'selected' : '' }}>{{ $r->name }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div> 
                                    </div><br><br>
                                </fieldset>
                            </div>
                        </div>
                    </form>
                </div>
             </div>
            <div class="card" id="section_divider">
                <div class="card-body" id="div_agenda">
                    <div class="row">
                        <div class="col-lg-12">
                            <fieldset>                                 
                                <div class="form-group">
                                    <label>Agenda</label>
                                    <input type="text" placeholder="Please fill your agenda" class="form-control input_agenda" id="agenda_appender">
                                </div>

                                <form id="form_agenda">
                                    @csrf
                                    @isset($DataAgenda)
                                        @php $no=0; @endphp
                                        @foreach ($DataAgenda as $da)
                                            @php $no++; @endphp
                                            <div class="form-group row" id="mom_agenda{{$no}}">
                                                <label class="col-form-label col-lg-2">Agenda {{$no}}</label>
                                                <div class="col-lg-10">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control input_agenda" name="mom_agenda[]" value="{{$da->agenda_desc}}" placeholder="Agenda Meeting">
                                                        <span class="input-group-append btn_rm_agenda">
                                                            <a class="btn btn-danger" onclick="remove_agenda({{$da->agenda_id}})">
                                                                <i class="icon-trash icon-large"></i> Delete</a>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        @endforeach
                                    @endisset

                                    <div id="agenda_konten"></div>

                                </form>
                            </fieldset>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="card" id="section_divider">
                <div class="card-body" id="div_discuss">
                    <div class="row">
                        <div class="col-lg-12">
                            <fieldset>                                 
                                <div class="form-group">
                                    <label>Discussion</label>
                                </div>

                                <form id="form_discuss">
                                    @csrf 
                                    <div id="discuss_konten"></div> 
                                </form>
                            </fieldset>
                        </div>
                    </div>
                </div> 
            </div>
            <style type="text/css"> 
                tabCustom { 
                    padding-right:88px; 
                    padding-left: 88px;
                }
            </style>
            <div class="row">
                <div class="col-lg-12">
                    <div class="text-center" id="div_btn_discuss">
                        <input type="hidden" readonly id="temp_mom_id">
                        @if (session('group_id') == '2')
                            <p>
                                <button type="button" class="btn btn-danger btn-sm" id="btn_update_status_mom" onclick="update_status_mom()">
                                <tabCustom> Update MoM <i class="icon-paperplane ml-2"></i> </tabCustom>
                                </button>
                            </p>
                        @endif
                    </div>
                </div> 
            </div>
        </div>
    </div>
@endsection

@section('page_js')
<script>
    $(document).ready(function(){
        mom_category();   
        meeting_called_by();
        discuss_konten({{$DataMoM->mom_id}});

        $('.input_mom').prop('disabled', true);
        $('.input_agenda').prop('disabled', true);
        $('.input_diskusi').prop('disabled', true);
        $('.btn_rm_agenda').hide();

        var nomor = 0;
        $('#agenda_appender').on('keyup', function (e) {
            if (e.keyCode == 13) {
                nomor++;  
                $('#agenda_konten').append('<div class="form-group row" id="mom_agenda'+nomor+'">\
                                            <label class="col-form-label col-lg-2">Agenda '+nomor+'</label>\
                                            <div class="col-lg-10">\
                                                <div class="input-group">\
                                                    <input type="text" class="form-control input_agenda" name="mom_agenda[]" value="'+this.value+'" placeholder="Agenda Meeting">\
                                                    <span class="input-group-append btn_rm_agenda">\
                                                        <a class="btn btn-danger" onclick="remove_agenda('+nomor+')">\
                                                            <i class="icon-trash icon-large"></i> Delete</a>\
                                                    </span>\
                                                </div>\
                                            </div>\
                                        </div>');
                $('#agenda_appender').val('');
            }
        });
    });

    function remove_agenda(par){
        $('#mom_agenda'+par).remove();
        $('#agenda_appender').focus();
    }

    function mom_category(){
        $.ajax({
            url: "{{ route('param.category') }}",
            type: "POST",
            data: {
                "_token": "{{ csrf_token() }}"
            },
            success: function(s){
                $('#category_id').html(s);
            },
            complete: function(){
                $('#category_id').val({{ $DataMoM->mom_title }})
            },
            error: function(e){
                alert(e);
            },
        });
    }

    function meeting_called_by(){
        $.ajax({
            url: "{{ route('param.meeting_called_by') }}",
            type: "POST",
            data: {
                "_token": "{{ csrf_token() }}" 
            },
            success: function(s){
                $('#meeting_called_by').html(s);
            },
            complete: function(){
                $('#meeting_called_by').val({{ $DataMoM->mom_called_by }})
            },
            error: function(e){
                alert(e);
            },
        });
    }

    function discuss_konten(mom_id){
        $.ajax({
            url: "{{ route('mom.discuss') }}",
            type: "POST",
            data: {
                "_token": "{{ csrf_token() }}" ,
                "mom_id": mom_id,
            },
            success: function(s){
                // console.log(s);
                $('#discuss_konten').html(s);
            }, 
            error: function(e){
                alert(e);
            },
        });
    }

    function update_status_mom(){
        $.ajax({
            type: "POST",
            url: "{{ route('mom.store_status_mom') }}",
            data: $('#form_discuss').serialize(),
            beforeSend: function(){
                small_loader_open('form_discuss');
            },
            success: function (s) {   
                small_loader_close('form_discuss'); 
                $('.input_diskusi').prop('disabled', true);
                $('html, body').animate({
                    scrollTop: $("#discuss_konten").offset().top
                }, 2000);

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