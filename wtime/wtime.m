function value = wtime ( )

%*****************************************************************************80
%
%% WIME returns a reading of the wallclock time.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 August 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real VALUE, the wall clock time in seconds since the first
%    call to WTIME.
%
  persistent initialized
  persistent start

  if ( isempty ( initialized ) )
    initialized = 1;
    start = now;
    value = 0;
  else
    value = ( now - start ) * 24 * 60 * 60;
  end

  return
end
