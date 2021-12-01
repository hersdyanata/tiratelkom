@php
    $num = 0;
@endphp
@foreach ($agenda as $r)
    @php
        $num++;
    @endphp
    <div class="row">
        <h6 class="font-weight-bold"><i>{{ $num }}. {{ $r->agenda_desc }}</i></h6>
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
                            @if ($dtd->discuss_status == 'C')
                                <input type="text" class="form-control" name="status[]" id="status" value="{{$dtd->discuss_status}}" hidden>Closed
                            @else
                                @if ($dtd->discuss_status)
                                    <select class="form-control select" name="status[]" id="status">
                                        <option value="">-- Choose Priority --</option>
                                        <option value="O" {{ ($dtd->discuss_status == 'O') ? 'selected' : '' }}>Open</option> 
                                        <option value="C" {{ ($dtd->discuss_status == 'C') ? 'selected' : '' }}>Closed</option> 
                                    </select>
                                @else

                                @endif
                            @endif
                        </td>
                    </tr>
                    <tr>
                        <th></th>
                        <th colspan="5"><i class="font-weight-bold">Progress Report</i></th> 
                        {{-- <th class="text-center"><p><span style="text-decoration: underline; color: #007ff7f6; cursor:pointer;" onclick="append_progress_{{ $dtd->discuss_id }}()">Add</span></p></th> --}}
                    </tr>  
                    <tr>
                        <th></th>
                        <th colspan="5">
                            <table class="table table-columned table-xs"> 
                                <tbody>
                                    <div class="form-group"  >
                                        <td width="10%" class="text-center">
                                            <input type="text" id="progress_date_{{ $dtd->discuss_id }}" class="form-control daterange-single {{ ($dtd->discuss_status == 'C') ? 'input_diskusi' : '' }}">
                                        </td>
                                        <td width="90%">
                                            <input type="text" class="form-control {{ ($dtd->discuss_status == 'C') ? 'input_diskusi' : '' }}" placeholder="Please fill your progress" id="progress_appender_{{ $dtd->discuss_id }}">
                                            <script>
                                                $('#progress_appender_{{ $dtd->discuss_id }}').on('keyup', function (e) {
                                                    if (e.keyCode == 13) {
                                                        $.ajax({
                                                            type: "POST",
                                                            url: "{{ route('mom.store_discuss_progress') }}",
                                                            data: {
                                                                "_token": "{{ csrf_token() }}",
                                                                "mom_id" : "{{ $dtd->discuss_mom_id }}",
                                                                "agenda_id" : "{{ $dtd->discuss_agenda_id }}",
                                                                "discuss_id" : "{{ $dtd->discuss_id }}",
                                                                "prog_date" : $('#progress_date_{{ $dtd->discuss_id }}').val(),
                                                                "prog_desc" : $('#progress_appender_{{ $dtd->discuss_id }}').val(),
                                                            }, 
                                                            success: function (s) {   
                                                                // console.log(s);
                                                                // $('#body_poin_{{ $dtd->discuss_id }}').append(s);
                                                            },
                                                            complete: function(){
                                                                // small_loader_close('table_pointer_{{ $dtd->discuss_id }}');
                                                            },
                                                            error: function(e){
                                                                sw_multi_error(e);
                                                            }
                                                        });                                                     
                                                    }
                                                });
                                            </script>
                                        </td>
                                    </div>
                                </tbody>
                            </table>
                            <hr>
                            <table class="table table-columned table-xs"> 
                                <tbody>
                                    <tr id="progress_konten_{{ $dtd->discuss_id }}"></tr>
                                </tbody> 
                            </table>
                            <hr>
                            <table class="table table-columned table-xs"> 
                                <tbody>
                                    <div>
                                        @php
                                            $dtProgress = $mom->get_progress_by_mom_agenda_discuss_id($dtd->discuss_mom_id, $dtd->discuss_agenda_id, $dtd->discuss_id);
                                            $no=0;
                                        @endphp

                                        @foreach ($dtProgress as $dtp)
                                            @php 
                                                $no++; 
                                            @endphp 
                                            <tr>
                                                <td width="5%" class="text-center">
                                                    {{$no}}
                                                </td>
                                                <td width="10%" class="text-center">
                                                    {{$dtp->progress_date}}
                                                </td>
                                                <td width="85%">
                                                    {{$dtp->progress_desc}}
                                                </td>
                                            </tr>
                                        @endforeach
                                    </div>
                                </tbody> 
                            </table>
                        </th> 
                        <th></th>
                    </tr>  

                    <script>                        
                        var nomor = 0;
                        $('#progress_appender_{{ $dtd->discuss_id }}').on('keyup', function (e) {
                            if (e.keyCode == 13) {
                                nomor++;    
                                $('#progress_konten_{{ $dtd->discuss_id }}').append('<tr>\
                                                                                        <td width="27%" class="text-center">\
                                                                                            '+$('#progress_date_{{ $dtd->discuss_id }}').val()+'\
                                                                                        </td>\
                                                                                        <td width="85%">\
                                                                                            '+$('#progress_appender_{{ $dtd->discuss_id }}').val()+'\
                                                                                        </td>\
                                                                                    </tr>');
                                $('#progress_appender_{{ $dtd->discuss_id }}').val('');
                            }
                        });
                    </script>
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
    <br>

<script>
    $(document).ready(function(){
        $('.input_diskusi').prop('disabled', true);
    });
</script>

@endforeach