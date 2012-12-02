function sp = spdimcc(n, d)
% SPDIMCC   Computes the number of sparse grid points.
%    SP = SPDIMCC(N,D) Computes the number of sparse grid points
%	   of the Clenshaw-Gurtis grid of dimension D and level N.

% The function uses the formulas for N <= 7 given in A. Schreiber:
% Die Methode von Smolyak bei der multivariaten Interpolation,
% (2000), p.35/36. 
	
% Author : Andreas Klimke, Universität Stuttgart
% Version: 1.0
% Date   : August 5, 2003

switch n
 case 0
	sp = 1;
 case 1
	sp = 2*d + 1;
 case 2
	sp = 2*d^2 + 2*d + 1;
 case 3
	sp = round((4*d^3 + 6*d^2 + 14*d)/3) + 1;
 case 4 
	sp = round((2*d^4 + 4*d^3 + 22*d^2 + 20*d)/3) + 1;
 case 5
	sp = round((4*d^5 + 10*d^4 + 100*d^3 + 170*d^2 + 196*d)/15) + 1;
 case 6
	sp = round((4*d^6 + 12*d^5 + 190*d^4 + 480*d^3 + 1246*d^2 + 948* ...
							d)/45) + 1; 
 case 7
	sp = round((8*d^7 + 28*d^6 + 644*d^5 + 2170*d^4 + 9632*d^3 + ...
							15442*d^2 + 12396*d)/315) + 1;
 otherwise
	sp = round((8*d^7 + 28*d^6 + 644*d^5 + 2170*d^4 + 9632*d^3 + ...
							15442*d^2 + 12396*d)/315) + 1;
	for m = 8:n
		seq = spgetseq(m,d);
		for k = 1:size(seq,1)
			temp = 1;
			for l = 1:d
				lval = seq(k,l);
				if lval == 0
				elseif lval < 3
					temp = temp * 2;
				else
					temp = temp * 2^(lval-1);
				end
			end
			sp = sp + temp;
		end
	end
end
