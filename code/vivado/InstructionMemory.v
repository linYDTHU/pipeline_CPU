`timescale 1ns / 1ps
module InstructionMemory(Address, Instruction);
	input [31:0] Address;
	output reg [31:0] Instruction;
	
	always @(*)
		case (Address)
        32'h00400000:    Instruction <= 32'h0810003d;
        32'h80400004:    Instruction <= 32'h08100056;
        32'h80400008:    Instruction <= 32'h0810006e;
        32'h0040000c:    Instruction <= 32'h23bdffec;
        32'h00400010:    Instruction <= 32'hafbf0000;
        32'h00400014:    Instruction <= 32'hafb00004;
        32'h00400018:    Instruction <= 32'hafb10008;
        32'h0040001c:    Instruction <= 32'hafa8000c;
        32'h00400020:    Instruction <= 32'hafa90010;
        32'h00400024:    Instruction <= 32'h00048021;
        32'h00400028:    Instruction <= 32'h00058821;
        32'h0040002c:    Instruction <= 32'h00114080;
        32'h00400030:    Instruction <= 32'h21090004;
        32'h00400034:    Instruction <= 32'h02084020;
        32'h00400038:    Instruction <= 32'h02094820;
        32'h0040003c:    Instruction <= 32'h8d0a0000;
        32'h00400040:    Instruction <= 32'h8d2b0000;
        32'h00400044:    Instruction <= 32'had0b0000;
        32'h00400048:    Instruction <= 32'had2a0000;
        32'h0040004c:    Instruction <= 32'h00001021;
        32'h00400050:    Instruction <= 32'h8fbf0000;
        32'h00400054:    Instruction <= 32'h8fb00004;
        32'h00400058:    Instruction <= 32'h8fb10008;
        32'h0040005c:    Instruction <= 32'h8fa8000c;
        32'h00400060:    Instruction <= 32'h8fa90010;
        32'h00400064:    Instruction <= 32'h23bd0014;
        32'h00400068:    Instruction <= 32'h03e00008;
        32'h0040006c:    Instruction <= 32'h23bdfff4;
        32'h00400070:    Instruction <= 32'hafbf0000;
        32'h00400074:    Instruction <= 32'hafb00004;
        32'h00400078:    Instruction <= 32'hafb10008;
        32'h0040007c:    Instruction <= 32'h00048021;
        32'h00400080:    Instruction <= 32'h00058821;
        32'h00400084:    Instruction <= 32'h24080000;
        32'h00400088:    Instruction <= 32'h0111082a;
        32'h0040008c:    Instruction <= 32'h10200013;
        32'h00400090:    Instruction <= 32'h2109ffff;
        32'h00400094:    Instruction <= 32'h0120082a;
        32'h00400098:    Instruction <= 32'h240c0001;
        32'h0040009c:    Instruction <= 32'h102c000d;
        32'h004000a0:    Instruction <= 32'h00095080;
        32'h004000a4:    Instruction <= 32'h214b0004;
        32'h004000a8:    Instruction <= 32'h020a5020;
        32'h004000ac:    Instruction <= 32'h020b5820;
        32'h004000b0:    Instruction <= 32'h8d4a0000;
        32'h004000b4:    Instruction <= 32'h8d6b0000;
        32'h004000b8:    Instruction <= 32'h016a082a;
        32'h004000bc:    Instruction <= 32'h10200005;
        32'h004000c0:    Instruction <= 32'h00102021;
        32'h004000c4:    Instruction <= 32'h00092821;
        32'h004000c8:    Instruction <= 32'h0c100003;
        32'h004000cc:    Instruction <= 32'h2129ffff;
        32'h004000d0:    Instruction <= 32'h08100025;
        32'h004000d4:    Instruction <= 32'h21080001;
        32'h004000d8:    Instruction <= 32'h08100022;
        32'h004000dc:    Instruction <= 32'h00001021;
        32'h004000e0:    Instruction <= 32'h8fbf0000;
        32'h004000e4:    Instruction <= 32'h8fb00004;
        32'h004000e8:    Instruction <= 32'h8fb10008;
        32'h004000ec:    Instruction <= 32'h23bd000c;
        32'h004000f0:    Instruction <= 32'h03e00008;
        32'h004000f4:    Instruction <= 32'h24080004;
        32'h004000f8:    Instruction <= 32'hac080000;
        32'h004000fc:    Instruction <= 32'h24080004;
        32'h00400100:    Instruction <= 32'hac080004;
        32'h00400104:    Instruction <= 32'h24080003;
        32'h00400108:    Instruction <= 32'hac080008;
        32'h0040010c:    Instruction <= 32'h24080002;
        32'h00400110:    Instruction <= 32'hac08000c;
        32'h00400114:    Instruction <= 32'h24080001;
        32'h00400118:    Instruction <= 32'hac080010;
        32'h0040011c:    Instruction <= 32'h00008021;
        32'h00400120:    Instruction <= 32'h8e110000;
        32'h00400124:    Instruction <= 32'h22100004;
        32'h00400128:    Instruction <= 32'h00102021;
        32'h0040012c:    Instruction <= 32'h00112821;
        32'h00400130:    Instruction <= 32'h0c10001b;
        32'h00400134:    Instruction <= 32'h3c0d4000;
        32'h00400138:    Instruction <= 32'h8daf0014;
        32'h0040013c:    Instruction <= 32'h24140e00;
        32'h00400140:    Instruction <= 32'h240eff9c;
        32'h00400144:    Instruction <= 32'hadae0000;
        32'h00400148:    Instruction <= 32'hadae0004;
        32'h0040014c:    Instruction <= 32'h240e0003;
        32'h00400150:    Instruction <= 32'hadae0008;
        32'h00400154:    Instruction <= 32'h1000ffff;
        
        32'h80400158:    Instruction <= 32'h240e0000;
        32'h8040015c:    Instruction <= 32'hadae0008;
        32'h80400160:    Instruction <= 32'h0c10006f;
        32'h80400164:    Instruction <= 32'h0c10008c;
        32'h80400168:    Instruction <= 32'h0c100090;
        32'h8040016c:    Instruction <= 32'h0c100095;
        32'h80400170:    Instruction <= 32'h0c10009a;
        32'h80400174:    Instruction <= 32'h0c10009f;
        32'h80400178:    Instruction <= 32'h0c1000a4;
        32'h8040017c:    Instruction <= 32'h0c1000a9;
        32'h80400180:    Instruction <= 32'h0c1000ae;
        32'h80400184:    Instruction <= 32'h0c1000b3;
        32'h80400188:    Instruction <= 32'h0c1000b8;
        32'h8040018c:    Instruction <= 32'h0c1000bd;
        32'h80400190:    Instruction <= 32'h0c1000c2;
        32'h80400194:    Instruction <= 32'h0c1000c7;
        32'h80400198:    Instruction <= 32'h0c1000cc;
        32'h8040019c:    Instruction <= 32'h0c1000d1;
        32'h804001a0:    Instruction <= 32'h0c1000d6;
        32'h804001a4:    Instruction <= 32'h02f8b820;
        32'h804001a8:    Instruction <= 32'hadb70010;
        32'h804001ac:    Instruction <= 32'h240e0003;
        32'h804001b0:    Instruction <= 32'hadae0008;
        32'h804001b4:    Instruction <= 32'h03400008;
        32'h804001b8:    Instruction <= 32'h03400008;
        32'h804001bc:    Instruction <= 32'h24150e00;
        32'h804001c0:    Instruction <= 32'h1295000a;
        32'h804001c4:    Instruction <= 32'h24150d00;
        32'h804001c8:    Instruction <= 32'h1295000d;
        32'h804001cc:    Instruction <= 32'h24150b00;
        32'h804001d0:    Instruction <= 32'h12950011;
        32'h804001d4:    Instruction <= 32'h3416f000;
        32'h804001d8:    Instruction <= 32'h01f6b824;
        32'h804001dc:    Instruction <= 32'h0017bb02;
        32'h804001e0:    Instruction <= 32'h0014c021;
        32'h804001e4:    Instruction <= 32'h24140e00;
        32'h804001e8:    Instruction <= 32'h03e00008;
        32'h804001ec:    Instruction <= 32'h2416000f;
        32'h804001f0:    Instruction <= 32'h01f6b824;
        32'h804001f4:    Instruction <= 32'h0014c021;
        32'h804001f8:    Instruction <= 32'h24140d00;
        32'h804001fc:    Instruction <= 32'h03e00008;
        32'h80400200:    Instruction <= 32'h241600f0;
        32'h80400204:    Instruction <= 32'h01f6b824;
        32'h80400208:    Instruction <= 32'h0017b902;
        32'h8040020c:    Instruction <= 32'h0014c021;
        32'h80400210:    Instruction <= 32'h24140b00;
        32'h80400214:    Instruction <= 32'h03e00008;
        32'h80400218:    Instruction <= 32'h24160f00;
        32'h8040021c:    Instruction <= 32'h01f6b824;
        32'h80400220:    Instruction <= 32'h0017ba02;
        32'h80400224:    Instruction <= 32'h0014c021;
        32'h80400228:    Instruction <= 32'h24140700;
        32'h8040022c:    Instruction <= 32'h03e00008;
        32'h80400230:    Instruction <= 32'h12e00001;
        32'h80400234:    Instruction <= 32'h03e00008;
        32'h80400238:    Instruction <= 32'h24170040;
        32'h8040023c:    Instruction <= 32'h03e00008;
        32'h80400240:    Instruction <= 32'h24190001;
        32'h80400244:    Instruction <= 32'h12f90001;
        32'h80400248:    Instruction <= 32'h03e00008;
        32'h8040024c:    Instruction <= 32'h24170079;
        32'h80400250:    Instruction <= 32'h03e00008;
        32'h80400254:    Instruction <= 32'h24190002;
        32'h80400258:    Instruction <= 32'h12f90001;
        32'h8040025c:    Instruction <= 32'h03e00008;
        32'h80400260:    Instruction <= 32'h24170024;
        32'h80400264:    Instruction <= 32'h03e00008;
        32'h80400268:    Instruction <= 32'h24190003;
        32'h8040026c:    Instruction <= 32'h12f90001;
        32'h80400270:    Instruction <= 32'h03e00008;
        32'h80400274:    Instruction <= 32'h24170030;
        32'h80400278:    Instruction <= 32'h03e00008;
        32'h8040027c:    Instruction <= 32'h24190004;
        32'h80400280:    Instruction <= 32'h12f90001;
        32'h80400284:    Instruction <= 32'h03e00008;
        32'h80400288:    Instruction <= 32'h24170019;
        32'h8040028c:    Instruction <= 32'h03e00008;
        32'h80400290:    Instruction <= 32'h24190005;
        32'h80400294:    Instruction <= 32'h12f90001;
        32'h80400298:    Instruction <= 32'h03e00008;
        32'h8040029c:    Instruction <= 32'h24170012;
        32'h804002a0:    Instruction <= 32'h03e00008;
        32'h804002a4:    Instruction <= 32'h24190006;
        32'h804002a8:    Instruction <= 32'h12f90001;
        32'h804002ac:    Instruction <= 32'h03e00008;
        32'h804002b0:    Instruction <= 32'h24170002;
        32'h804002b4:    Instruction <= 32'h03e00008;
        32'h804002b8:    Instruction <= 32'h24190007;
        32'h804002bc:    Instruction <= 32'h12f90001;
        32'h804002c0:    Instruction <= 32'h03e00008;
        32'h804002c4:    Instruction <= 32'h24170078;
        32'h804002c8:    Instruction <= 32'h03e00008;
        32'h804002cc:    Instruction <= 32'h24190008;
        32'h804002d0:    Instruction <= 32'h12f90001;
        32'h804002d4:    Instruction <= 32'h03e00008;
        32'h804002d8:    Instruction <= 32'h24170000;
        32'h804002dc:    Instruction <= 32'h03e00008;
        32'h804002e0:    Instruction <= 32'h24190009;
        32'h804002e4:    Instruction <= 32'h12f90001;
        32'h804002e8:    Instruction <= 32'h03e00008;
        32'h804002ec:    Instruction <= 32'h24170010;
        32'h804002f0:    Instruction <= 32'h03e00008;
        32'h804002f4:    Instruction <= 32'h2419000a;
        32'h804002f8:    Instruction <= 32'h12f90001;
        32'h804002fc:    Instruction <= 32'h03e00008;
        32'h80400300:    Instruction <= 32'h24170020;
        32'h80400304:    Instruction <= 32'h03e00008;
        32'h80400308:    Instruction <= 32'h2419000b;
        32'h8040030c:    Instruction <= 32'h12f90001;
        32'h80400310:    Instruction <= 32'h03e00008;
        32'h80400314:    Instruction <= 32'h24170003;
        32'h80400318:    Instruction <= 32'h03e00008;
        32'h8040031c:    Instruction <= 32'h2419000c;
        32'h80400320:    Instruction <= 32'h12f90001;
        32'h80400324:    Instruction <= 32'h03e00008;
        32'h80400328:    Instruction <= 32'h24170046;
        32'h8040032c:    Instruction <= 32'h03e00008;
        32'h80400330:    Instruction <= 32'h2419000d;
        32'h80400334:    Instruction <= 32'h12f90001;
        32'h80400338:    Instruction <= 32'h03e00008;
        32'h8040033c:    Instruction <= 32'h24170021;
        32'h80400340:    Instruction <= 32'h03e00008;
        32'h80400344:    Instruction <= 32'h2419000e;
        32'h80400348:    Instruction <= 32'h12f90001;
        32'h8040034c:    Instruction <= 32'h03e00008;
        32'h80400350:    Instruction <= 32'h24170006;
        32'h80400354:    Instruction <= 32'h03e00008;
        32'h80400358:    Instruction <= 32'h2419000f;
        32'h8040035c:    Instruction <= 32'h12f90001;
        32'h80400360:    Instruction <= 32'h03e00008;
        32'h80400364:    Instruction <= 32'h2417000e;
        32'h80400368:    Instruction <= 32'h03e00008;
        default: Instruction <= 32'h00000000;
		endcase
		
endmodule
