function assemble_stiff ( )

%*****************************************************************************80
%
%% ASSEMBLE_STIFF assembles the stiffness matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 April 2006
%
  global area
  global difeta 
  global indx
  global m
  global nel
  global neqn
  global nnodes  
  global node
  global nq
  global nunk
  global xc

  a_stiff = zeros(nunk,nunk); 
  xq = zeros(3);
  wq = zeros(3);
%
%  Set up quadrature information on [-1,1]
%
  [ xq, wq ] = gauss3pt;

  for it = 1 : nel 

    for iq = 1 : nq

      x = xc(node(it,1)) + area(it) / 2.0 * ( xq(iq) + 1.0 );
      ar = area(it) * wq(iq);

      for in = 1 : nnodes

        ip = node(it,in);
        i = indx(ip);

        if ( 0 < i )

          [ bb, bx ] = quadbf ( x, it, in, xc, node ); 

          for inn = 1 : nnodes

            ipp = node(it,inn);
            [ bbb, bbx ] = quadbf ( x, it, inn, xc, node );
            j = indx(ipp);

            if ( 0 < j )
              aij = bb * bbb + dt * difeta * bx * bbx; 
              a_stiff(i,j) = a_stiff(i,j) + aij * ar; 
            end

          end

        end

      end

    end       

  end  

  return
end
