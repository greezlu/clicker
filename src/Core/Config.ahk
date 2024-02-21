class Config extends BaseControl
{
    static interval := 60000
    static defaultInterval := 60000

    static radius := 5
    static defaultRadius := 5

    static setInterval(interval := Config.defaultInterval)
    {
        if (IsDigit(interval)) {
            Config.interval := Integer(interval) * 1000
        } else {
            Config.interval := Config.defaultInterval
        }
    }

    static setRadius(radius := Config.defaultRadius)
    {
        if (IsDigit(radius)) {
            Config.radius := Integer(radius)
        } else {
            Config.radius := Config.defaultRadius
        }
    }
}
