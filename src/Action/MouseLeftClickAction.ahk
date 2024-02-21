class MouseLeftClickAction extends Action
{
    static mouseSpeed := 30

    __New(x_coord, y_coord, pid, name)
    {
        super.__New(pid, name)
        this.x_coord := x_coord
        this.y_coord := y_coord
    }

    click()
    {
        new_x := Round(this.random(
            this.x_coord - Config.radius,
            this.x_coord + Config.radius
        ))

        new_y := Round(this.random(
            this.y_coord - Config.radius,
            this.y_coord + Config.radius
        ))

        MouseMove new_x, new_y, MouseLeftClickAction.mouseSpeed
        MouseClick "left"

        super.click()
    }

    details()
    {
        return Format("PID: {1} | {2} | mouse", this.actionPid, this.actionName)
    }
}
