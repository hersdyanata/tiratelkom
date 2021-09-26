@extends('layouts.app')
@section('header')
    Create MoM
@endsection
@section('content')
<form id="form_data">
    @csrf
    <div class="row">
        <div class="col-xl-12">
            <div class="card" id="section_divider">
                <div class="card-header header-elements-inline">
                    <h5 class="card-title">{{ $title }}</h5>
                </div>

                <div class="card-body">
                    <form action="#">
                        <div class="row">
                            <div class="col-lg-12">
                                <fieldset> 
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-group">
                                                <label class="font-weight-semibold">Title</label>
                                                <select class="form-control select" name="category_id" id="category_id">
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
                                                <input type="text" placeholder="Event Title" class="form-control" name="event_title" id="event_title">
                                            </div>
                                        </div> 
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-4">
                                            <div class="form-group">
                                                <label class="font-weight-semibold">Date</label>
                                                <div class="input-group">
                                                    <input type="text" placeholder="Set Date" class="form-control daterange-single" name="date" id="date">
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
                                                    <input type="text" placeholder="Set Time" class="form-control pickatime-clear" name="time" id="time">
                                                    <span class="input-group-prepend">
                                                        <span class="input-group-text"><i class="mi-schedule"></i></span>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-lg-4">
                                            <div class="form-group">
                                                <label class="font-weight-semibold">Duration</label>
                                                <input type="text" placeholder="Set Duration" class="form-control touchspin-vertical" name="duration" id="duration">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-group">
                                                <label class="font-weight-semibold">Location</label>
                                                <input type="text" placeholder="Location" class="form-control" name="location" id="location">
                                            </div>
                                        </div> 
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-group">
                                                <label class="font-weight-semibold">Meeting Called By</label>
                                                <input type="text" placeholder="Meeting Called By" class="form-control" name="meeting_called_by" id="meeting_called_by">
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
                                                            <input type="checkbox" class="form-check-input" value="{{$dt->type_id}}" id="meeting_{{$dt->type_id}}" name="meeting[{{$dt->type_id}}]">
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
                                                <input type="text" class="form-control tokenfield" placeholder="Add tag" name="participant_id" id="participant_id" data-fouc>
                                            </div>
                                        </div> 
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="text-center">
                                                <button type="button" class="btn btn-danger" id="next_to_agenda" onclick="simpan_data()">Next <i class="icon-arrow-right8 ml-2"></i></button>
                                            </div>
                                        </div> 
                                    </div>

                                    

                                    <hr>
                                   

                                    <div id="agenda">
                                        <div class="form-group">
                                            <label>Agenda</label>
                                            <textarea rows="12" cols="5" class="form-control" placeholder="Enter your message here"></textarea>
                                        </div>
                                    </div>
                                </fieldset>
                            </div>
                        </div>

                        
                    </form>
                </div>
            </div>
        </div>
    </div>
</form>
@endsection

@section('page_js')
<script>

    $('document').ready(function(){
        $('#agenda').hide();
    });

    function simpan_data(){
        $('#agenda').show();
        $('html, body').animate({
            scrollTop: $("#agenda").offset().top
        }, 2000);
        // $.ajax({
        //     type: "POST",
        //     url: "{{ route('mom.store') }}",
        //     data: $('#form_data').serialize(),
        //     beforeSend: function(){
        //         small_loader_open('form_data');
        //     },
        //     success: function (s) {
        //         sw_success_redirect(s, "{{ route('mom.index') }}");
        //     },
        //     error: function(e){
        //         sw_multi_error(e);
        //     },
        //     complete: function(){
        //         small_loader_close('form_data');
        //     }
        // });
    }
</script>
@endsection