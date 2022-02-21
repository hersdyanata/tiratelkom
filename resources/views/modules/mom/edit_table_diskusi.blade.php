@php
    $no = 0;
@endphp
@foreach ($agenda as $ra)
    @php
        $no++;
    @endphp
    <div class="row">
        <div class="col-xl-12">
            <h6 class="font-weight-bold"><i>{{ $no }}. {{ $ra->agenda_desc }}</i></h6>
            <div id="table_pointer_{{ $ra->agenda_id }}">
                {{-- <div id="body_poin_{{ $r->agenda_id }}"> --}}
                    @inject('mom', 'App\Services\MomService')
                    @php
                        $dtDiscuss = $mom->get_discuss_by_mom_id_agenda($ra->mom_id, $ra->agenda_id);
                    @endphp

                    @foreach ($dtDiscuss as $dtd)
                        <hr>
                        <div class="row">
                            <div class="col-lg-12">
                                <fieldset> 
                                    <input type="hidden" class="form-control" name="discuss_id[]" id="discuss_id" value="{{ $dtd->discuss_id }}">
                                    <input type="hidden" class="form-control" name="mom_id[]" id="mom_id" value="{{ $dtd->discuss_mom_id }}">
                                    <input type="hidden" class="form-control" name="agenda_id[]" id="agenda_id" value="{{ $dtd->discuss_agenda_id }}">

                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-group"> 
                                                <label class="font-weight-semibold">Pointer</label>
                                                <textarea placeholder="Pointer" class="form-control input_diskusi" name="pointer[]" id="pointer">{{ $dtd->discuss_pointer}}</textarea>
                                            </div>
                                        </div> 
                                    </div> 

                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-group"> 
                                                <label class="font-weight-semibold">Assignment</label>
                                                <textarea type="text" placeholder="Assignment" class="form-control input_diskusi" name="assignment[]" id="assignment">{{ $dtd->discuss_assignment }}</textarea>
                                            </div>
                                        </div> 
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-3">
                                            <div class="form-group">
                                                <label class="font-weight-semibold">UIC</label>
                                                <div class="form-group">
                                                    <select class="form-control select input_diskusi" name="uic[]" id="uic">
                                                        <option value="">-- Choose --</option>
                                                        @foreach ($uics as $r)
                                                            @php
                                                                $uicDiscuss = $dtDiscuss->where('discuss_uic_id', $r->uic_id)
                                                                                        ->where('discuss_id', $dtd->discuss_id)
                                                                                        ->pluck('discuss_uic_id')->first();
                                                            @endphp
                                                                <option value="{{ $r->uic_id }}" {{ ($uicDiscuss == $r->uic_id ) ? 'selected' : '' }}>{{  $r->uic_desc}}</option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-lg-3">
                                            <div class="form-group">
                                                <label class="font-weight-semibold">Due Date</label>
                                                <div class="form-group form-group-feedback form-group-feedback-right">
                                                    <input type="text" placeholder="Set Due Date" class="form-control due_date input_diskusi" name="due_date[]" id="due_date" value="{{ date("d/m/Y", strtotime($dtd->discuss_due_date)) }}">
                                                    <div class="form-control-feedback">
                                                        <i class="icon-calendar22 text-muted"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-lg-3">
                                            <div class="form-group">
                                                <label class="font-weight-semibold">Priority</label>
                                                <div class="form-group">
                                                    <select class="form-control select input_diskusi" name="priority[]" id="priority">
                                                        <option value="">-- Choose Priority --</option>
                                                        <option value="3" {{ ($dtd->discuss_priority == '3') ? 'selected' : '' }}>High</option> 
                                                        <option value="2" {{ ($dtd->discuss_priority == '2') ? 'selected' : '' }}>Normal</option>
                                                        <option value="1" {{ ($dtd->discuss_priority == '1') ? 'selected' : '' }}>Low</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div> 

                                        <div class="col-lg-3">
                                            <div class="form-group">
                                                <label class="font-weight-semibold">Status</label>
                                                <div class="form-group">
                                                    <select class="form-control select input_diskusi" name="status[]" id="status">
                                                        <option value="">-- Choose Priority --</option>
                                                        <option value="O" {{ ($dtd->discuss_status == 'O') ? 'selected' : '' }}>Open</option> 
                                                        <option value="C" {{ ($dtd->discuss_status == 'C') ? 'selected' : '' }}>Closed</option> 
                                                    </select>
                                                </div>
                                            </div>
                                        </div> 
                                    </div>
                                </fieldset>
                            </div>
                        </div> 
                    @endforeach
                {{-- </div> --}}
            </div>
        </div>
    </div> 
    
    <div class="row mt-2 btn_add_item_diskusi" id="btn_add_item_diskusi">
        <i class="icon-plus-circle2 ml-2 " onclick="append_row_{{ $ra->agenda_id }}()"></i> 
    </div>
    <br>
    
    <script>
        $(document).ready(function(){
            $('.input_diskusi').prop('disabled', true);
            $('.btn_add_item_diskusi').hide();
        });

    
        function append_row_{{ $ra->agenda_id }}(){
            $.ajax({
                type: "POST",
                url: "{{ route('mom.add_row_poin') }}",
                data: {
                    "_token": "{{ csrf_token() }}",
                    "mom_id" : "{{ $ra->mom_id }}",
                    "agenda_id" : "{{ $ra->agenda_id }}"
                },
                beforeSend: function(){
                    small_loader_open('table_pointer_{{ $ra->agenda_id }}');
                },
                success: function (s) {   
                    $('#table_pointer_{{ $ra->agenda_id }}').append(s);
                },
                complete: function(){
                    small_loader_close('table_pointer_{{ $ra->agenda_id }}');
                },
                error: function(e){
                    sw_multi_error(e);
                }
            });
        } 

        $('#due_date').daterangepicker({
            parentEl: '.content-inner',
            singleDatePicker: true,
            locale: {
                format: 'DD/MM/YYYY'
            }
        });
    </script>

@endforeach