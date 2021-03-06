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
                                                    <input type="text" placeholder="Set Date" class="form-control date input_mom" name="date" id="date" value="{{ date("d/m/Y", strtotime($DataMoM->mom_date)) }}">
                                                    <div class="form-control-feedback">
                                                        <i class="icon-calendar22 text-muted"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-lg-4">
                                            <div class="form-group">
                                                <label class="font-weight-semibold">Start</label>
                                                <div class="form-group">
                                                    <input type="time" placeholder="Set Time" class="form-control input_mom" name="mom_start" id="mom_start" value="{{ $DataMoM->mom_start }}">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-lg-4">
                                            <div class="form-group">
                                                <label class="font-weight-semibold">End</label>
                                                <div class="form-group">
                                                    <input type="time" placeholder="Set Time" class="form-control input_mom" name="mom_end" id="mom_end" value="{{ $DataMoM->mom_end }}">
                                                </div>
                                            </div>
                                        </div>
                                        {{-- <div class="col-lg-2">
                                            <div class="form-group">
                                                <label class="font-weight-semibold">Unit</label>
                                                <input type="text" placeholder="Second/Hour" class="form-control input_mom" name="unit" id="unit">
                                            </div>
                                        </div> --}}
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

                                    {{-- initial data for edit mom --}}
                                    <input type="text" readonly id="temp_edit_mom_id" name="temp_edit_mom_id" value="{{ $DataMoM->mom_id }}" hidden>
                                    
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="text-center">
                                                <button type="button" class="btn btn-dark btn-sm" id="btn_edit_mom" onclick="edit_mom()">Edit <i class="icon-pencil ml-2"></i></button>
                                                <button type="button" class="btn btn-danger btn-sm" id="btn_update_mom" onclick="update_mom()">Next <i class="icon-arrow-right8 ml-2"></i></button>
                                            </div>
                                        </div> 
                                    </div>
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
                                    
                                    {{-- initial data for edit agenda --}}
                                    <input type="text" readonly name="agenda_mom_id" id="agenda_mom_id" class="input_agenda" value="{{ $DataMoM->mom_id }}" hidden>
                                    <div id="agenda_konten"></div>

                                </form>

                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="text-center"> 
                                            <button type="button" class="btn btn-dark btn-sm" id="btn_edit_agenda" onclick="edit_agenda()">Edit <i class="icon-pencil ml-2"></i></button>
                                            <button type="button" class="btn btn-danger btn-sm" id="btn_update_agenda" onclick="update_agenda()">Next<i class="icon-arrow-right8 ml-2"></i></button>
                                        </div>
                                    </div> 
                                </div>
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
                        <p>
                            <button type="button" class="btn btn-dark btn-sm" id="btn_edit_draft" onclick="edit_data_diskusi()">Edit as Draft <i class="icon-pencil ml-2"></i></button>
                            <button type="button" class="btn btn-dark btn-sm" id="btn_save_draft" onclick="simpan_data_diskusi()">Save as Draft <i class="icon-file-plus ml-2"></i></button> &ensp;
                            <button type="button" class="btn btn-primary btn-sm" id="btn_preview_mom" onclick="preview_mom()">Preview MoM <i class="icon-file-eye ml-2"></i></button> 
                        </p>
                        <p>
                            <button type="button" class="btn btn-danger btn-sm" id="btn_discuss" onclick="submit_data_mom()">
                            <tabCustom> Submit MoM <i class="icon-paperplane ml-2"></i> </tabCustom>
                            </button>
                        </p>
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
 
        $('#btn_update_mom').hide(); 
        $('#btn_update_agenda').hide(); 
        $('#btn_save_draft').hide(); 
        $('#btn_edit_mom').prop('disabled', true);
        $('#btn_edit_agenda').prop('disabled', true);
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
            url: "{{ route('mom.edit_discuss') }}",
            type: "POST",
            data: {
                "_token": "{{ csrf_token() }}" ,
                "mom_id": mom_id,
            },
            success: function(s){
                $('#discuss_konten').html(s);
            }, 
            error: function(e){
                alert(e);
            },
        });
    } 

    function edit_mom(){
        $('.input_mom').prop('disabled', false);
        $('#event_title').focus(); 
        $('#btn_edit_mom').hide();
        $('#btn_update_mom').show();
        $('#btn_agenda').hide();
        $('#btn_edit_agenda').show();
        $('#btn_update_agenda').hide();
        $('#div_agenda').hide();
        $('#div_discuss').hide();
        $('#div_btn_discuss').hide();
        $('html, body').animate({
            scrollTop: $("#form_data").offset().top
        }, 500);        
    }

    function update_mom(){
        $.ajax({
            type: "POST",
            url: "{{ route('mom.update_mom') }}",
            data: $('#form_data').serialize(),
            beforeSend: function(){
                small_loader_open('form_data');
            },
            success: function (s) {   
                small_loader_close('form_data'); 
                $('.input_mom').prop('disabled', true);
                $('.input_agenda').prop('disabled', true);
                $('#div_agenda').show();
                $('#div_discuss').show();
                $('.btn_rm_agenda').hide();
                $('#btn_edit_mom').show(); 
                $('#div_btn_discuss').show(); 
                $('#btn_update_mom').hide();
                $('#btn_save_mom').hide();
                $('html, body').animate({
                    scrollTop: $("#div_agenda").offset().top
                }, 2000);

            },
            complete: function(){
                small_loader_close('form_data');
            },
            error: function(e){
                sw_multi_error(e);
            }
        });
    }

    function edit_agenda(){
        $('.input_agenda').prop('disabled', false);
        $('#div_discuss').hide();
        $('#agenda_appender').focus(); 
        $('#btn_edit_agenda').hide();
        $('#btn_update_agenda').show(); 
        $('.btn_rm_agenda').show();
        $('#div_btn_discuss').hide();
        $('html, body').animate({
            scrollTop: $("#div_agenda").offset().top
        }, 500);
    }

    function update_agenda(){ 
        $.ajax({
            type: "POST",
            url: "{{ route('mom.update_agenda') }}",
            data: $('#form_agenda').serialize(),
            beforeSend: function(){
                small_loader_open('form_agenda');
            },
            success: function (s) {
                small_loader_close('form_agenda');
                $('#discuss_konten').html(s);
                $('#discuss_mom_id').val(s);
                $('#discuss_agenda_id').val(s);
                $('.input_agenda').prop('disabled', true);
                $('#div_discuss').show();
                $('#div_btn_discuss').show();
                $('#btn_edit_agenda').show();
                $('#btn_update_agenda').hide(); 
                $('#btn_edit_draft').show();
                $('#btn_save_draft').hide(); 
                $('.btn_rm_agenda').hide();
                $('html, body').animate({
                    scrollTop: $("#div_agenda").offset().top
                }, 500);
            },
            complete: function(){
                small_loader_close('form_agenda');
            },
            error: function(e){
                sw_multi_error(e);
            }
        });
    }

    function edit_data_diskusi(){
        $('.input_diskusi').prop('disabled', false);  
        $('#btn_edit_mom').prop('disabled', false);
        $('#btn_edit_agenda').prop('disabled', false);
        $('.btn_add_item_diskusi').show();
        $('#discuss_id').focus(); 
        $('#btn_edit_draft').hide(); 
        $('#btn_save_draft').show(); 
        $('html, body').animate({
            scrollTop: $("#form_discuss").offset().top
        }, 500);        
    }

    function simpan_data_diskusi(){
        $.ajax({
            type: "POST",
            url: "{{ route('mom.store_draft_mom') }}",
            data: $('#form_discuss').serialize(),
            beforeSend: function(){
                small_loader_open('form_discuss');
            },
            success: function (s) {
                $('#temp_mom_id').val(s);
                small_loader_close('form_discuss');
                $('#btn_preview_mom').prop('disabled', false);
                $('#btn_discuss').prop('disabled', false);
                $('.input_diskusi').prop('disabled', true);
                $('.btn_add_item_diskusi').hide();
                $('#btn_edit_draft').show(); 
                $('#btn_save_draft').hide(); 
                $('#btn_edit_mom').prop('disabled', true);
                $('#btn_edit_agenda').prop('disabled', true);
            },
            complete: function(){
                small_loader_close('form_discuss');
            },
            error: function(e){
                sw_multi_error(e);
            }
        });
    }

    function preview_mom(){
        window.location.href = "{{ route('mom.show', ':x') }}".replace(':x',$('#temp_edit_mom_id').val());
    } 

</script>
@endsection