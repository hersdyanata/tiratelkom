 <tr>
    <td>
        {{-- <a class="btn btn-danger" onclick="remove_discuss('+nomor+')">
            <i class="icon-trash icon-small"></i>
        </a> --}}
    </td>    
    <td hidden>
        <input type="hidden" class="form-control input_diskusi" name="mom_id[]" value="{{ $agenda->mom_id }}">
    </td>
    <td hidden>
        <input type="hidden" class="form-control input_diskusi" name="agenda_id[]" value="{{ $agenda->agenda_id }}">
    </td>
    <td>
        <input type="text" class="form-control input_diskusi" name="pointer[]" id="pointer">
    </td>
    <td>
        <input type="text" class="form-control input_diskusi" name="assignment[]" id="assignment">
    </td>
    <td>
        <select class="form-control select input_diskusi" name="uic[]" id="uic">
            <option value="">-- Choose --</option>
            @foreach ($uics as $r)
                <option value="{{ $r->uic_id }}">{{ $r->uic_code }}</option>
            @endforeach
        </select>
    </td>
    <td>
        <input type="text" class="form-control daterange-single input_diskusi" name="due_date[]" id="due_date">
    </td>
    <td>
        <select class="form-control select input_diskusi" name="priority[]" id="priority">
            <option value="3">High</option>
            <option value="2">Normal</option>
            <option value="1">Low</option>
        </select>
    </td>
    <td>
        <select class="form-control select input_diskusi" name="status[]" id="status">
            <option value="O">Open</option>
            <option value="C">Closed</option>
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

