function err ( )

%% ERR computes the L2 and H1 errors using a 2 point Gauss quadrature rule.
%
%  Modified:
%
%    26 April 2006
%

%
%  Set up the quadrature information.
%
  [ xq, wq ] = gauss3pt; 

  el2 = 0.0;
  eh1 = 0.0;

  for it = 1 : nel  

    for iq = 1 : nq
      ar = area(it) * wq(iq);
      x = xc(node(it,1)) + area(it) / 2.0 * ( xq(iq) + 1.0 );
      uh = 0.0;
      uhx = 0.0; 
      for in = 1 : nnodes
        ip = node(it,in);
        [ bb, bx ] = quadbf ( x, it, in, xc, node );
        i = indx(ip);
        if ( i ~= 0 )
          uh = uh + bb * f(i);
          uhx = uhx + bx * f(i); 
        end
      end
      [ uex, uexx ] = exact ( x );
      el2 = el2 + ar * ( uh - uex )^2; 
      eh1 = eh1 + ar * ( uhx - uexx )^2 );
    end
  end

  el2 = sqrt ( el2 )
  eh1 = sqrt ( eh1 )

  return
end
