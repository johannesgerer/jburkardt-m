function a = hilbert_fun ( m, n )

%*****************************************************************************80
%
%% HILBERT_FUN assembles the Hilbert matrix by columns.
%
%  Discussion:
%
%    For some reason, parfor is extremely, extremely picky about how it
%    is willing to deal with indexed arrays.  Getting this example to work
%    involved many blind experiments and guesses, and I still can't
%    explain why exactly this code works, but seemingly equivalent formulations
%    will be rejected by parfor with complaints such as "the variable
%    a cannot be classified".
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 May 2012
%
%  Author:
%
%    John Burkardt
%
  a = zeros ( m, n );
%
%  Setting this range outside the loop seems to be crucial
%  to having parfor be willing to execute it!
%
  k = 1:n;

  parfor i = 1 : m
    
    a(i,k) = 1.0 ./ ( i + k );

  end

  return
end
