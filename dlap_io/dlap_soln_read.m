function [ soln, ios ] = dlap_soln_read ( iunit, n )

%*****************************************************************************80
%
%% DLAP_SOLN_READ reads the solution vector from a DLAP file.
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
%    Output, real SOLN(N), the solution vector.
%
%    Output, integer IOS, the I/O status variable, which is 0 if
%    no I/O error occurred.
%
  ios = 0
  soln = zeros(n,1);

  for i = 1 : n

    line = fgets ( iunit );

    if ( line == -1 )
      ios = 1;
      break
    end

    [ soln(i), count ] = sscanf ( line, '%f' );

    if ( count ~= 1 )
      ios = 2;
      break
    end

  end

  return
end
