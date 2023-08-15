--MTK by NuclearBuilders

local computer = require("computer")
local c = require("component")
local fs = require("filesystem")
local term = require("term")
local rsio = c.proxy("8ab1384e-a8a3-448c-9db5-7ea28d560e17") --Адрес рсио который будет управлять нашим МТК
local gpu = c.gpu

gpu.setResolution(120, 60) --Ставим разрешение МТК

gpu.setBackground(0x1f1f1f) --Устанавливаем цвет фона 
gpu.setForeground(0xFFFFFF)

gpu.fill(1, 1, 120, 60, " ")

--ЗаставОЧКА
term.setCursor(50, 30)
term.write("МТК ВИУР 2023 г.")
term.setCursor(50, 32)
term.write("By NuclearBuilders")
computer.beep(200)
computer.beep(300)
computer.beep(500)
computer.beep(800)
os.sleep(2)
term.clear()

--Код для вычисления реального времени
local TIME_ZONE = 4 --Таймзона (по умолчанию 0)
local t_correction = TIME_ZONE * 3600 
local function getTimeHost()
    local file = fs.open('unix.tmp', 'w')
    file:write('')
    file:close()
    local lastmod = tonumber(string.sub(fs.lastModified('unix.tmp'), 1, -4)) + t_correction
    return lastmod
end

local w, h = gpu.getResolution()


gpu.setBackground(0x000000)
gpu.setForeground(0xffffff)

    --Режимы МТК
    term.setCursor(8, 2)
    term.write("Nтк")

    term.setCursor(16, 2)
    term.write("Tгр")

    term.setCursor(24, 2)
    term.write("Pтк")

while true do
    --Выводим время
    local t = getTimeHost()
    gpu.setBackground(0x404040)
    gpu.setForeground(0xf5f5f5)
    term.setCursor(w - 10, 2)
    term.write(os.date("%H:%M:%S", t)) --Вывод времени
    term.setCursor(w - 11, 3)
    term.write(os.date("%d.%m.%Y", t)) --Вывод даты
    term.setCursor(47, 30)
    --Просто заглушка
    term.write("МТК в режиме тестирования.")


    --Завершение работы по нажатию
if rsio.getInput(1) > 0 then
    term.clear()
    gpu.setBackground(0x000000)
    gpu.setForeground(0xffffff)
    computer.beep(800)
    computer.beep(500)
    computer.beep(300)
    computer.beep(200)
    term.setCursor(47, 30)
    term.write("МТК Завершение работы...")
    os.sleep(3)
    computer.shutdown(true)
end

end
