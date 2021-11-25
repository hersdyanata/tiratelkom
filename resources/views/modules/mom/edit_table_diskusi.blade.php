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
                    <th><i>Status</i></th>
                </tr>
            </thead>
            <tbody id="body_poin_{{ $r->agenda_id }}">
                @inject('mom', 'App\Services\MomService')
                @php
                    $dtDiscuss = $mom->get_discuss_by_mom_id_agenda($r->mom_id, $r->agenda_id);
                @endphp

                @foreach ($dtDiscuss as $dtd)
                    <tr>
                        <td></td>   
                        <td hidden>
                            <input type="hidden" class="form-control" name="discuss_id[]" id="discuss_id" value="{{ $dtd->discuss_id }}">
                        </td> 
                        <td hidden>
                            <input type="hidden" class="form-control" name="mom_id[]" id="mom_id" value="{{ $dtd->discuss_mom_id }}">
                        </td>
                        <td hidden>
                            <input type="hidden" class="form-control" name="agenda_id[]" id="agenda_id" value="{{ $dtd->discuss_agenda_id }}">
                        </td>
                        <td>
                            <input type="text" class="form-control input_diskusi" name="pointer[]" id="pointer" value="{{ $dtd->discuss_pointer}}">
                        </td>
                        <td>
                            <input type="text" class="form-control input_diskusi" name="assignment[]" id="assignment" value ="{{ $dtd->discuss_assignment }}">
                        </td>
                        <td>
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
                        </td>
                        <td>
                            <input type="text" class="form-control daterange-single input_diskusi" name="due_date[]" id="due_date">
                        </td>
                        <td>
                            <select class="form-control select input_diskusi" name="priority[]" id="priority">
                                <option value="">-- Choose Priority --</option>
                                <option value="3" {{ ($dtd->discuss_priority == '3') ? 'selected' : '' }}>High</option> 
                                <option value="2" {{ ($dtd->discuss_priority == '2') ? 'selected' : '' }}>Normal</option>
                                <option value="1" {{ ($dtd->discuss_priority == '1') ? 'selected' : '' }}>Low</option>
                            </select>
                        </td>
                        <td>
                            <select class="form-control select {{ ($dtd->discuss_status == 'C') ? 'input_diskusia' : '' }}" name="status[]" id="status">
                                <option value="">-- Choose Priority --</option>
                                <option value="O" {{ ($dtd->discuss_status == 'O') ? 'selected' : '' }}>Open</option> 
                                <option value="C" {{ ($dtd->discuss_status == 'C') ? 'selected' : '' }}>Closed</option> 
                            </select>
                        </td>
                    </tr>
                @endforeach                        
                <script>
                    $('.daterange-single').daterangepicker({
                        parentEl: '.content-inner',
                        singleDatePicker: true
                    });
                </script>                  
            </tbody>
        </table>
    </div>

    <div class="row mt-2" id="btn_add_item_diskusi">
        <i class="icon-plus-circle2 ml-2 " onclick="append_row_{{ $r->agenda_id }}()"></i> 
    </div>

<script>
    $(document).ready(function(){
        $('.input_diskusi').prop('disabled', true);
    });

  
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