class MouseClickAction
{
    __New(pid, x_coord, y_coord, radius)
    {
        this.x_coord := x_coord
        this.y_coord := y_coord
        this.radius := radius
        this.pid := pid
    }

    click()
    {
        new_x := Round(target_random(this.x_coord - this.radius, this.x_coord + this.radius))
        new_y := Round(target_random(this.y_coord - this.radius, this.y_coord + this.radius))

        MouseMove, %new_x%, %new_y%, %mouse_speed%
        MouseClick, left
    }
}
