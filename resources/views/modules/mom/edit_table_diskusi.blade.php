@php
    $no = 0;
@endphp
@foreach ($agenda as $r)
    @php
        $no++;
    @endphp
    <div class="row">
        <h6 class="font-weight-bold"><i>{{ $no }}. {{ $r->agenda_desc }}</i></h6>
            <table class="table table-hover table-bordered table-xs" id="table_pointer_{{ $r->agenda_id }}">
            <thead>
                <tr>
                    <th class="text-center">#</th>
                    <th><i>Pointer</i></th>
                    <th><i>Assignment</i></th>
                    <th><i>UIC</i></th>
                    <th><i>Due Date</i></th>
                    <th><i>Priority</i></th>
                    <th><i>Progress</i></th>
                    <th><i>Status</i></th>
                </tr>
            </thead>
            <tbody id="body_poin_{{ $r->agenda_id }}">
                <tr>
                    <td></td>    
                    <td hidden>
                        <input type="hidden" class="form-control input_diskusi" name="mom_id[]" value="{{ $r->mom_id }}">
                    </td>
                    <td hidden>
                        <input type="hidden" class="form-control input_diskusi" name="agenda_id[]" value="{{ $r->agenda_id }}">
                    </td>
                    <td>
                        <input type="text" class="form-control input_diskusi" name="pointer[]" id="pointer" value="test">
                    </td>
                    <td>
                        <input type="text" class="form-control input_diskusi" name="assignment[]" id="assignment" value ="test">
                    </td>
                    <td>
                        <input type="text" class="form-control" name="uic[]" id="uic">
                        {{-- <select multiple="multiple" class="form-control input_diskusi select-fixed-single" data-fouc data-container-css-class="select2-filled" name="uic[]" id="uic[]" >
                            @foreach ($uics as $r)
                                <option value="{{ $r->uic_id }}">{{ $r->uic_code }}</option>
                            @endforeach
                        </select> --}}
                    </td>
                    <td>
                        <input type="text" class="form-control daterange-single input_diskusi" name="due_date[]" id="due_date">
                    </td>
                    <td>
                        <select class="form-control select input_diskusi" name="priority[]" id="priority">
                            <option value="High">High</option>
                            <option value="Normal">Normal</option>
                            <option value="Low">Low</option>
                        </select>
                    </td>
                    <td>
                        <input type="text" class="form-control input_diskusi" name="progress[]" id="progress">
                    </td>
                    <td>
                        <select class="form-control select input_diskusi" name="status[]" id="status">
                            <option value="Open">Open</option>
                            <option value="Closed">Closed</option>
                        </select>
                    </td>
                </tr>
                <script>
                    $('.daterange-single').daterangepicker({
                        parentEl: '.content-inner',
                        singleDatePicker: true
                    });
                
                    $('.select-fixed-single').select2({
                        minimumResultsForSearch: Infinity,
                        containerCssClass: 'select-xs',
                        width: 230
                    });
                 
                </script>  
                
                
            </tbody>
        </table>
    </div>

    <div class="row mt-2" id="btn_add_item_diskusi">
        {{-- <button type="button" class="btn btn-primary btn-sm" onclick="append_row_{{ $r->agenda_id }}()"> --}}
            <i class="icon-plus-circle2 ml-2 " onclick="append_row_{{ $r->agenda_id }}()"></i> 
        {{-- </button> --}}
    </div>

    <hr>

    <script>
        function append_row_{{ $r->agenda_id }}(){
            $.ajax({
                type: "POST",
                url: "{{ route('mom.add_row_poin') }}",
                data: {
                    "_token": "{{ csrf_token() }}",
                    "mom_id" : "{{ $r->mom_id }}",
                    "agenda_id" : "{{ $r->agenda_id }}"
                },
                beforeSend: function(){
                    small_loader_open('table_pointer_{{ $r->agenda_id }}');
                },
                success: function (s) {   
                    // console.log(s);
                    $('#body_poin_{{ $r->agenda_id }}').append(s);
                },
                complete: function(){
                    small_loader_close('table_pointer_{{ $r->agenda_id }}');
                },
                error: function(e){
                    sw_multi_error(e);
                }
            });
        }
    </script>
@endforeach