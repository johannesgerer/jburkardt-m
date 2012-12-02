function [ idtop, idbot ] = ratmat_det ( n, iatop, iabot )

%*****************************************************************************80
%
%% RATMAT_DET finds the determinant of an N by N matrix of rational entries.
%
%  Discussion:
%
%    The brute force method is used.
%
%    This routine should only be used for small matrices, since this
%    calculation requires the summation of N! products of N numbers.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    21 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of rows and columns of A.
%
%    Input, integer IATOP(N,N), IABOT(N,N), the numerators
%    and denominators of the entries of the matrix.
%
%    Output, integer IDTOP, IDBOT, the determinant of the matrix,
%    expressed as IDTOP/IDBOT.
%
  more = 0;
  idtop = 0;
  idbot = 1;
  p = [];
  even = 0;
  
  while ( 1 )

    [ p, more, even ] = perm_next ( n, p, more, even );

    if ( even )
      itop = 1;
    else
      itop = -1;
    end

    ibot = 1;

    for i = 1 : n

      [ itop, ibot ] = rat_mul ( itop, ibot, iatop(i,p(i)), iabot(i,p(i)) );

    end

    [ idtop, idbot ] = rat_add ( itop, ibot, idtop, idbot );

    if ( ~more )
      break
    end

  end
%
%  The bottom should be positive.
%
  if ( idbot < 0 )
    idbot = -idbot;
    idtop = -idtop;
  end

  return
end
