dofile("/misc/ncl30/TRUSTV/nwf/widgets/edit.lua")

--global values
local http = require("socket.http")
local canvasW, canvasH = canvas:attrSize()

local edtNumeroCartao = Edit:new(canvas)
	  edtNumeroCartao.top = 273
	  edtNumeroCartao.left = 383
	  edtNumeroCartao.width = 400
	  edtNumeroCartao.height = 42
	  
local edtSaldoAtual = Edit:new(canvas)
	  edtSaldoAtual.top = 430
	  edtSaldoAtual.left = 196
	  edtSaldoAtual.width = 587
	  edtSaldoAtual.height = 219
	  
local botaoOk = canvas:new('/misc/ncl30/TRUSTV/visa/media/ok_amarelo.png')
local botaoOkCinza = canvas:new('/misc/ncl30/TRUSTV/visa/media/ok_cinza.png')
local loading = canvas:new('/misc/ncl30/TRUSTV/visa/media/loading.gif')
local stopEvent = { class = 'ncl', type = 'presentation', action = 'stop' }

--initialization
canvas:compose(738, 333, botaoOk)

-- --------------------
function callWebServer()
	if (string.len(edtNumeroCartao.text) > 0) then
		local webPage = http.request("http://www.cbss.com.br/senew/Extract.do?card=" .. edtNumeroCartao.text)	
		edtSaldoAtual.text = "Saldo Atual: R$ " .. string.match(string.match(webPage, '&nbsp;R$&nbsp;.*</p'), "%d+,%d+")
	end
end

-- --------------------
function evtHandler(evt)	
	if (evt.class == 'key') then 
		if (evt.type == 'release') then
			edtNumeroCartao:update(evt.key)
			
			if (evt.key == 'ENTER') then
				callWebServer()
			end		
		end
	end

 	edtNumeroCartao:draw() 	
 	edtSaldoAtual:draw()
 	canvas:flush()
	
	return true
end

--EVENT HANDLERS--
event.register(evtHandler)


