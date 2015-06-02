function [ rhs, ios ] = dlap_rhs_read ( iunit, n )

%*****************************************************************************80
%
%% DLAP_RHS_READ reads the right hand side vector from a DLAP file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 January 2014
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Mark Seager,
%    A SLAP for the Masses,
%    Lawrence Livermore National Laboratory,
%    Technical Report UCRL-100267, December 1988.
%
%  Parameters:
%
%    Input, integer IUNIT, the I/O device to be read.
%
%    Input, integer N, the order of the matrix.
%
%    Output, real RHS(N), the right hand side vector.
%
%    Output, integer IOS, the I/O status variable, which is 0 if
%    no I/O error occurred.
%
  ios = 0
  rhs = zeros(n,1);

  for i = 1 : n

    line = fgets ( iunit );

    if ( line == -1 )
      ios = 1;
      break
    end

    [ rhs(i), count ] = sscanf ( line, '%f' );

    if ( count ~= 1 )
      ios = 2;
      break
    end

  end

  return
end
