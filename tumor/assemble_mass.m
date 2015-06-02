function a_mass = assemble_mass ( area, indx, nel, neqn, nnodes, node, ...
  nq, nunk, xc )

%*****************************************************************************80
%
%% ASSEMBLE_MASS assembles the mass matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 June 2006
%
%  Parameters:
%
%    Input, real AREA(NEL), the area (length) of each element.
%
%    Input, integer INDX(NP), gives the index of the finite element variable
%    associated with each node, or 0 if none.
%
%    Input, integer NEL, the number of elements.
%
%    Input, integer NEQN, the number of equations.
%
%    Input, integer NNODES, the number of nodes per element.
%
%    Input, integer NODE(NEL,NNODES), the indices of the nodes making up each element.
%
%    Input, integer NQ, the number of quadrature points per element used in the
%    assembly process.
%
%    Input, integer NUNK, the number of unknowns.
%
%    Input, real XC(NP), the X coordinate of each node.
%
%    Input, real A_MASS(NUNK,NUNK), the mass matrix.
%
  global area;
  global indx;
  global nel;
  global neqn;
  global nnodes;
  global node;
  global nq;
  global nunk;
  global xc;

  a_mass = zeros ( nunk, nunk ); 
  xq = zeros(3);
  wq = zeros(3);

  [ xq, wq ] = gauss3pt ( );

  for it = 1 : nel

    for iq = 1 : nq

      xl = xc(node(it,1));
      x = xl + area(it) / 2.0 * ( xq(iq) + 1.0 );
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

           if ( j ~= 0 )
             aij = bb * bbb; 
             a_mass(i,j) = a_mass(i,j) + aij * ar; 
           end

          end

        end

      end

    end			 

  end  

  return
end
