function [ indx, i, j, i_save, j_save, k_save, l_save, n_save ] = ...
  sort_safe_rc ( n, indx, isgn, i_save, j_save, k_save, l_save, n_save )

%*****************************************************************************80
%
%% SORT_SAFE_RC externally sorts a list of items into ascending order.
%
%  Discussion:
%
%    This is a version of SORT_RC which does not rely on
%    storing certain work variables internally to the function.  This makes
%    the function somewhat more awkward to call, but easier to program
%    in a variety of languages, and safe to use in a parallel programming
%    environment, or in cases where the sorting of several vectors is to
%    be carried out at more or less the same time.
%
%    The actual list of data is not passed to the routine.  Hence this
%    routine may be used to sort integers, reals, numbers, names,
%    dates, shoe sizes, and so on.  After each call, the routine asks
%    the user to compare or interchange two items, until a special
%    return value signals that the sorting is completed.
%
%  Example:
%
%    n = 100;
%    indx = 0;
%    isgn = 0;
%    i_save = 0;
%    j_save = 0;
%    k_save = 0;
%    l_save = 0;
%    n_save = 0;
%
%    while ( 1 )
%
%      [ indx, i, j, i_save, j_save, k_save, l_save, n_save ] = ...
%        sort_safe_rc ( n, indx, isgn, i_save, j_save, k_save, l_save, n_save );
%
%      if ( indx < 0 )
%
%        isgn = 1;
%        if ( a(i) <= a(j) )
%          isgn = -1;
%        end
%
%      elseif ( 0 < indx )
%
%        k    = a(i);
%        a(i) = a(j);
%        a(j) = k;
%
%      else
%
%        break;
%
%      end
%
%    end
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 March 2015
%
%  Author:
%
%    Original FORTRAN77 version by Albert Nijenhuis, Herbert Wilf.
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Albert Nijenhuis, Herbert Wilf.
%    Combinatorial Algorithms,
%    Academic Press, 1978, second edition,
%    ISBN 0-12-519260-6.
%
%  Parameters:
%
%    Input, integer N, the number of items to be sorted.
%
%    Input, integer INDX, the main communication signal.
%    The user must set INDX to 0 before the first call.
%    Thereafter, the user should set the input value of INDX
%    to the output value from the previous call.
%
%    Input, integer ISGN, results of comparison of elements I and J.
%    (Used only when the previous call returned INDX less than 0).
%    ISGN <= 0 means I is less than or equal to J;
%    0 <= ISGN means I is greater than or equal to J.
%
%    Output, integer INDX, the main communication signal.
%    If INDX is
%    * greater than 0, the user should:
%      interchange items I and J;
%      call again.
%    * less than 0, the user should:
%      compare items I and J;
%      set ISGN = -1 if I < J, ISGN = +1 if J < I;
%      call again.
%    * equal to 0, the sorting is done.
%
%    Output, integer I, J, the indices of two items.
%    On return with INDX positive, elements I and J should be interchanged.
%    On return with INDX negative, elements I and J should be compared, and
%    the result reported in ISGN on the next call.
%
%    Input/output, integer I_SAVE, J_SAVE, K_SAVE, L_SAVE, N_SAVE, workspace 
%    needed by the routine.  Before calling the function,
%    the user should declare variables to hold these values, but should
%    not change them, and need not ever examine them.
%

%
%  INDX = 0: This is the first call.
%
  if ( indx == 0 )
      
    k_save = floor ( n / 2 );
    l_save = k_save;
    n_save = n;
%
%  INDX < 0: The user is returning the results of a comparison.
%
  elseif ( indx < 0 )

    if ( indx == -2 )

      if ( isgn < 0 )
        i_save = i_save + 1;
      end

      j_save = l_save;
      l_save = i_save;
      indx = -1;
      i = i_save;
      j = j_save;
      return;
    end

    if ( 0 < isgn )
      indx = 2;
      i = i_save;
      j = j_save;
      return;
    end

    if ( k_save <= 1 )

      if ( n_save == 1 )
        i_save = 0;
        j_save = 0;
        indx = 0;
      else
        i_save = n_save;
        n_save = n_save - 1;
        j_save = 1;
        indx = 1;
      end

      i = i_save;
      j = j_save;
      return;

    end

    k_save = k_save - 1;
    l_save = k_save;
%
%  0 < INDX, the user was asked to make an interchange.
%
  elseif ( indx == 1 )

    l_save = k_save;

  end

  while ( 1 )

    i_save = 2 * l_save;

    if ( i_save == n_save )
      j_save = l_save;
      l_save = i_save;
      indx = -1;
      i = i_save;
      j = j_save;
      return;
    elseif ( i_save <= n_save )
      j_save = i_save + 1;
      indx = -2;
      i = i_save;
      j = j_save;
      return;
    end

    if ( k_save <= 1 )
      break;
    end

    k_save = k_save - 1;
    l_save = k_save;

  end

  if ( n_save == 1 )
    i_save = 0;
    j_save = 0;
    indx = 0;
    i = i_save;
    j = j_save;
  else
    i_save = n_save;
    n_save = n_save - 1;
    j_save = 1;
    indx = 1;
    i = i_save;
    j = j_save;
  end

  return
end
