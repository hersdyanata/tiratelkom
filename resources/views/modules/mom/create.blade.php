@extends('layouts.app')
@section('header')
    Create MoM
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
                                                    @foreach ($dataCategory as $dc)
                                                        <option value="{{ $dc->category_id }}">{{ $dc->category_desc }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div> 
                                    </div> 

                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-group"> 
                                                <input type="text" placeholder="Event Title" class="form-control input_mom" name="event_title" id="event_title">
                                            </div>
                                        </div> 
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-4">
                                            <div class="form-group">
                                                <label class="font-weight-semibold">Date</label>
                                                <div class="input-group">
                                                    <input type="text" placeholder="Set Date" class="form-control daterange-single input_mom" name="date" id="date">
                                                    <span class="input-group-prepend">
                                                        <span class="input-group-text"><i class="icon-calendar22"></i></span>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-lg-4">
                                            <div class="form-group">
                                                <label class="font-weight-semibold">Time</label>
                                                <div class="input-group">
                                                    <input type="text" placeholder="Set Time" class="form-control pickatime-clear input_mom" name="time" id="time">
                                                    <span class="input-group-prepend">
                                                        <span class="input-group-text"><i class="mi-schedule"></i></span>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-lg-4">
                                            <div class="form-group">
                                                <label class="font-weight-semibold">Duration</label>
                                                <input type="text" placeholder="Set Duration" class="form-control touchspin-vertical input_mom" name="duration" id="duration">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-group">
                                                <label class="font-weight-semibold">Location</label>
                                                <input type="text" placeholder="Location" class="form-control input_mom" name="location" id="location">
                                            </div>
                                        </div> 
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-group">
                                                <label class="font-weight-semibold">Meeting Called By</label>
                                                <input type="text" placeholder="Meeting Called By" class="form-control input_mom" name="meeting_called_by" id="meeting_called_by">
                                            </div>
                                        </div> 
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-group">
                                                <p class="font-weight-semibold">Type of Meeting</p>
                                                <div class="border p-3 rounded">
                                                    @foreach ($dataType as $dt)    
                                                        <div class="form-check form-check-inline">
                                                            <input type="checkbox" class="form-check-input input_mom" value="{{$dt->type_id}}" id="meeting_{{$dt->type_id}}" name="meeting[{{$dt->type_id}}]">
                                                            <label class="form-check-label" for="meeting_{{$dt->type_id}}">{{$dt->type_desc}}</label>
                                                        </div> 
                                                    @endforeach            
                                                </div>
                                            </div>
                                        </div>
                                    </div>
 

                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-group">
                                                <label>Participant</label>
                                                <input type="text" class="form-control tokenfield input_mom" placeholder="Add tag" name="participant_id" id="participant_id" data-fouc>
                                            </div>
                                        </div> 
                                    </div><br><br>
                                    
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="text-center">
                                                <button type="button" class="btn btn-danger btn-sm" id="btn_save_mom" onclick="simpan_data_mom()">Next <i class="icon-arrow-right8 ml-2"></i></button>
                                                <button type="button" class="btn btn-dark btn-sm" id="btn_edit_mom" onclick="edit_mom()">Edit <i class="icon-pencil ml-2"></i></button>
                                                <button type="button" class="btn btn-danger btn-sm" id="btn_update_mom" onclick="update_mom()">Next M2 <i class="icon-arrow-right8 ml-2"></i></button>
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
                                    <input type="text" readonly name="agenda_mom_id" id="agenda_mom_id" class="input_agenda" hidden>
                                    <div id="agenda_konten"></div>
                                </form>

                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="text-center">
                                            <button type="button" class="btn btn-danger btn-sm" id="btn_agenda" onclick="simpan_data_agenda()">Next <i class="icon-arrow-right8 ml-2"></i></button>
                                            <button type="button" class="btn btn-dark btn-sm" id="btn_edit_agenda" onclick="edit_agenda()">Edit <i class="icon-pencil ml-2"></i></button>
                                            <button type="button" class="btn btn-danger btn-sm" id="btn_update_agenda" onclick="update_agenda()">Next A2 <i class="icon-arrow-right8 ml-2"></i></button>
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
                        <p>
                            <button type="button" class="btn btn-dark btn-sm" id="btn_save_draft" onclick="simpan_data_diskusi()">Save as Draft <i class="icon-file-plus ml-2"></i></button> &ensp;
                            <button type="button" class="btn btn-primary btn-sm" id="btn_preview_mom">Preview MoM <i class="icon-file-eye ml-2"></i></button> 
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

    $('document').ready(function(){
        // jquery for part agenda 
        $('#div_agenda').hide();
        $('#div_discuss').hide();
        $('#btn_edit_mom').hide();
        $('#btn_update_mom').hide();
        $('#div_btn_discuss').hide(); 

        var nomor = 0;
        $('#agenda_appender').on('keyup', function (e) {
            if (e.keyCode == 13) {
                nomor++;
                // console.log(nomor);
                $('#agenda_konten').append('<div class="form-group row" id="mom_agenda'+nomor+'">\
                                            <label class="col-form-label col-lg-2">Agenda '+nomor+'</label>\
                                            <div class="col-lg-10">\
                                                <div class="input-group">\
                                                    <input type="text" class="form-control input_agenda" name="mom_agenda[]" value="'+this.value+'" placeholder="Agenda Meeting">\
                                                    <span class="input-group-append">\
                                                        <a class="btn btn-danger" onclick="remove_agenda('+nomor+')">\
                                                            <i class="icon-trash icon-large"></i> Delete</a>\
                                                    </span>\
                                                </div>\
                                            </div>\
                                        </div>');
                $('#agenda_appender').val('');
            }
        });

        // jquery for part discuss
        $('#div_discuss').hide();

        // jquery for participant column
        // $('.tokenfield').on('keyup', function(e){
        //     if(e.keyCode == 13){
        //         // console.log(this.val);
        //         console.log(this.prop);
        //         // lookup_uic(this.value);
        //     }
        // });
    });

    // function append_row(){
    //     $.ajax({
    //         type: "POST",
    //         url: "{{ route('mom.add_row_poin') }}",
    //         data: {
    //             "_token": "{{ csrf_token() }}"
    //         },
    //         beforeSend: function(){
    //             small_loader_open('table_pointer');
    //         },
    //         success: function (s) {   
    //             $('#body_poin').append(s);
    //         },
    //         complete: function(){
    //             small_loader_close('table_pointer');
    //         },
    //         error: function(e){
    //             sw_multi_error(e);
    //         }
    //     });
    // }

    function lookup_uic(par){
        console.log(par);
        $.ajax({
            // validasi si par ini ada gak di UIC????
            // kalo ada lanjutkan, kalo ga ada kasih warning terus gak bisa diapa2in
        });
    }

    function remove_agenda(par){
        $('#mom_agenda'+par).remove();
        $('#agenda_appender').focus();
    }

    function edit_mom(){
        $('.input_mom').prop('disabled', false);
        $('#event_title').focus(); 
        $('#btn_edit_mom').hide();
        $('#btn_update_mom').show();
        $('#btn_agenda').hide();
        $('#btn_edit_agenda').hide();
        $('#btn_update_agenda').show();
        $('#div_agenda').hide();
        $('#div_discuss').hide();
        $('#div_btn_discuss').hide();
        $('html, body').animate({
            scrollTop: $("#form_data").offset().top
        }, 500);
    }

    function update_mom(){
        $('.input_mom').prop('disabled', true);
        $('.input_agenda').prop('disabled', false);
        $('#div_agenda').show();
        $('#btn_edit_mom').show();
        $('#agenda_appender').focus();
        $('#btn_update_mom').hide();
        $('#btn_save_mom').hide();
        $('html, body').animate({
            scrollTop: $("#div_agenda").offset().top
        }, 2000);
    }

    function simpan_data_mom(){
        $.ajax({
            type: "POST",
            url: "{{ route('mom.store') }}",
            data: $('#form_data').serialize(),
            beforeSend: function(){
                small_loader_open('form_data');
            },
            success: function (s) {   
                // console.log(s);
                small_loader_close('form_data');
                $('#agenda_mom_id').val(s);
                $('#div_agenda').show();
                $('#btn_edit_mom').show();
                $('#btn_save_mom').hide();
                $('#btn_edit_agenda').hide();
                $('#btn_update_agenda').hide();

                $('.input_mom').prop('disabled', true);
                $('#agenda_appender').focus();

                $('html, body').animate({
                    scrollTop: $("#div_agenda").offset().top
                }, 2000);
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
        $('#div_btn_discuss').hide();
        $('html, body').animate({
            scrollTop: $("#div_agenda").offset().top
        }, 500);
    }

    function update_agenda(){
        $('.input_agenda').prop('disabled', true);
        $('#div_discuss').show();
        $('#div_btn_discuss').show();
        $('#btn_edit_agenda').show();
        $('#btn_update_agenda').hide(); 
        $('html, body').animate({
            scrollTop: $("#div_agenda").offset().top
        }, 500);
    }

    function simpan_data_agenda(){
        $.ajax({
            type: "POST",
            url: "{{ route('mom.create_agenda') }}",
            data: $('#form_agenda').serialize(),
            beforeSend: function(){
                // small_loader_open('form_agenda');
            },
            success: function (s) {
                $('#discuss_konten').html(s);

                $('.daterange-single').daterangepicker({
                    parentEl: '.content-inner',
                    singleDatePicker: true
                });
                // console.log(s);
                // $.each(s, function( key, value ) {
                //     $('#discuss_konten').append('<div class="form-group row" id="mom_diskusi'+key+'">\
                //                             <label class="col-form-label col-lg-2">'+value.agenda_desc+'</label>\
                //                         </div>');
                // });
                // small_loader_close('form_agenda'); 
                $('#discuss_mom_id').val(s);
                $('#discuss_agenda_id').val(s);
                $('#div_discuss').show();
                $('#btn_agenda').hide();
                $('#btn_edit_agenda').show();   
                $('#div_btn_discuss').show(); 

                $('.input_agenda').prop('disabled', true);
                // $('#agenda_appender').focus();

                $('html, body').animate({
                    scrollTop: $("#div_agenda").offset().top
                }, 2000);
            },
            error: function(e){
                sw_multi_error(e);
            }
        });
    }

    function simpan_data_diskusi(){
        $.ajax({
            type: "POST",
            url: "{{ route('mom.create_draft_mom') }}",
            data: $('#form_discuss').serialize(),
            beforeSend: function(){
                // small_loader_open('form_discuss');
            },
            success: function (s) {
                console.log(s);
                // small_loader_close('form_discuss');
            },
            error: function(e){
                sw_multi_error(e);
            }
        });
    }

</script>
@endsection