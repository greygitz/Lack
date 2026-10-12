
local function charAt(string, index)
    return string.sub(string, index, index)
end

local program = [[]] -- put your program here !!

local jumped = false

local memory = {}

local pointer = 1

local pc = 1

local bracketDepth, jumpDepth, ifDepth = 0, 0, 0 -- for nested loops

local clipboard = 0

for i = 0, 2048 do
    memory[i] = 0
    --print("memory["..i.."] is now " .. memory[i])
end

while pc <= #program do

    --print("executing " .. charAt(program, pc) .. "; pc is " .. pc .. "; mem["..pointer.."] is now " .. memory[pointer])

    jumped = false
    
    if     charAt(program, pc) == "+" then
    
        memory[pointer] = memory[pointer] + 1
        
    elseif charAt(program, pc) == "-" then
    
        memory[pointer] = memory[pointer] - 1
        
    elseif charAt(program, pc) == "*" then
    
        memory[pointer] = memory[pointer] * 2
        
    elseif charAt(program, pc) == "/" then
    
        memory[pointer] = memory[pointer] / 2
        
    elseif charAt(program, pc) == "0" then    
    
        memory[pointer] = 0
        
    elseif charAt(program, pc) == ">" then
    
        pointer = pointer + 1
    
    elseif charAt(program, pc) == "<" then
    
        pointer = pointer - 1
		
    elseif charAt(program, pc) == "." then
    
        io.write( string.char( memory[pointer] ) ) -- io.write does NOT append \n like print does
		
	elseif charAt(program, pc) == "_" then
	
	    print() -- newline
        
    elseif charAt(program, pc) == "#" then    
    
        io.write( memory[pointer] )
        		
	elseif charAt(program, pc) == "$" then -- special command! the next character will be skipped and instead be overridden by $C's custom definition of C
	
	    if      charAt(program, pc+1) == "+" then
		
		    clipboard = memory[pointer] + clipboard
			
		elseif charAt(program, pc+1) == "-" then
		
		    clipboard = memory[pointer] - clipboard
			
	    elseif charAt(program, pc+1) == "*" then
		
		    clipboard = memory[pointer] * clipboard
			
		elseif charAt(program, pc+1) == "/" then
		
		    clipboard = memory[pointer] / clipboard
			
		elseif charAt(program, pc+1) == "C" then
		
		    clipboard = memory[pointer]
			
		elseif charAt(program, pc+1) == "V" then
		
		    memory[pointer] = clipboard
		
		end
	
	    pc = pc + 2
	    jumped = true
        
    elseif charAt(program, pc) == '"' then -- spread a string as ASCII across mem[p] and beyond, jump to after end quote
    
        local tempPointer = pointer
        local i = pc + 1
        
        while i <= #program do
            
            if charAt(program, i) == '"' then -- we've reached the end of the string!
                break
            else -- still consuming characters
                memory[tempPointer] = string.byte( charAt(program, i) ) -- set mem[tP] to consumed character
            end
            
            tempPointer = tempPointer + 1
            
            i = i + 1
            
        end
        
        pc = i + 1
        jumped = true        
        
    elseif charAt(program, pc) == "[" and memory[pointer] == 0 then -- if memory at pointer is 0 and command is [ ...
         
        bracketDepth = 1 -- we're already inside a bracket!
        
        for i = pc + 1, #program do -- iterate over the program with i (don't count current bracket)       ...if the selected cell is zero, then jump forward to the matching ] command...
        
            if charAt(program, i) == "[" then -- if we've found a [ at i, we're going deeper
                bracketDepth = bracketDepth + 1
            end
        
            if charAt(program, i) == "]" then -- if we've found a ] at i, we're exiting a loop
                bracketDepth = bracketDepth - 1 
            end
            
            if bracketDepth == 0 then -- we've found the matching end bracket!
                pc = i+1 -- jump to the position of the bracket + 1 (Wikipedia said so)
                jumped = true
                break
            end
            
        end
        
    elseif charAt(program, pc) == "]" and not (memory[pointer] == 0) then -- if memory at pointer is NOT 0 and command is ] ...
    
        bracketDepth = 1 -- we're already inside a bracket!
    
        for i = pc - 1, 1, -1 do -- iterate over the program *backwards* from the pc with i     ...if the selected cell is not zero, then jump backwards to the matching [ command...
            
            if charAt(program, i) == "]" then -- if we've found a ] at i, we're going deeper... remember, we're going backwards!
                bracketDepth = bracketDepth + 1
            end
        
            if charAt(program, i) == "[" then -- if we've found a [ at i, we're exiting a loop
                bracketDepth = bracketDepth - 1 
            end
            
            if bracketDepth == 0 then -- we've found the matching start bracket!
                pc = i+1 -- jump to the position of the bracket + 1
                jumped = true    
                break                
            end
        
        end    
    
    elseif charAt(program, pc) == "@" then -- unconditional jump ... PLEASE do not put ], [, ), or ( inside comments!!!
         
        jumpDepth = 1 -- we're already inside a jump!
         
        for i = pc+1, #program do
        
            if charAt(program, i) == "@" then -- we're going a jump deeper
                jumpDepth = jumpDepth + 1                
            end
            
            if charAt(program, i) == ";" then -- we're exiting a loop            
                jumpDepth = jumpDepth - 1                
            end
            
            if jumpDepth == 0 then -- we've found the matching ;!
                pc = i+1 -- jump to the position of the ; + 1 (otherwise, we'd execute a ; and that makes no sense)
                jumped = true
                break
            end
        end
        
    elseif charAt(program, pc) == "(" and memory[pointer] == 0 then -- IF, unlike [] which parses ] as "jump back if nonzero" ...
         
        ifDepth = 1 -- we're already inside a parenthesis!
        
        for i = pc + 1, #program do -- iterate over the program with i (don't count current bracket)       ...if the selected cell is zero, then jump forward to the matching ) command...
        
            if charAt(program, i) == "(" then -- if we've found a ( at i, we're going deeper
                ifDepth = ifDepth + 1
            end
        
            if charAt(program, i) == ")" then -- if we've found a ) at i, we're exiting a loop
                ifDepth = ifDepth - 1 
            end
            
            if ifDepth == 0 then -- we've found the matching end parenthesis!
                pc = i+1 -- jump to the position of the end bracket + 1 (otherwise, we'd execute a ) and that makes no sense)
                jumped = true
                break
            end
            
        end
    
    end
    if not jumped then pc = pc + 1 end
    
end
