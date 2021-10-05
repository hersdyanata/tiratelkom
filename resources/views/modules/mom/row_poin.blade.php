<tr>
    <td></td>    
    <td hidden>
        <input type="text" class="form-control" name="mom_id[]" value="{{ $agenda->mom_id }}">
    </td>
    <td hidden>
        <input type="text" class="form-control" name="agenda_id[]" value="{{ $agenda->agenda_id }}">
    </td>
    <td>
        <input type="text" class="form-control" name="pointer[]" id="pointer">
    </td>
    <td>
        <input type="text" class="form-control" name="assignment[]" id="assignment">
    </td>
    <td>
        <input type="text" class="form-control" name="uic[]" id="uic">
    </td>
    <td>
        <input type="text" class="form-control daterange-single" name="due_date[]" id="due_date">
    </td>
    <td>
        <select class="form-control select" name="priority[]" id="priority">
            <option value="high">High</option>
            <option value="normal">Normal</option>
            <option value="low">low</option>
        </select>
    </td>
    <td>
        <select class="form-control select" name="status[]" id="status">
            <option value="open">Open</option>
            <option value="closed">Closed</option>
        </select>
    </td>
</tr>