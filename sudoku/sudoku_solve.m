function S = sudoku_solve ( M, S )

%*****************************************************************************80
%
%% SUDOKU_SOLVE is a recursive program that solves Sudoku puzzles.
%
%  Example:
%
%    M = [0,0,1,9,0,0,0,0,8;6,0,0,0,8,5,0,3,0;0,0,7,0,6,0,1,0,0;...
%         0,3,4,0,9,0,0,0,0;0,0,0,5,0,4,0,0,0;0,0,0,0,1,0,4,2,0;...
%         0,0,5,0,7,0,9,0,0;0,1,0,8,4,0,0,0,7;7,0,0,0,0,9,2,0,0];
%
%    S = sudoku_solve(M)
%
%  Modified:
%
%    01 February 2009
%
%  Author:
%
%    G M Boynton
%
%  Parameters:
%
%    Input, integer M(9,9), a partially filled matrix with zeros in blank cells.
%
%    Input, integer S, a list of solutions; only used during recursive calls.
%
%    Output, integer S, a list of solutions.
%

%
%  If this is the first call, then zero out the solution matrix.
%
  if ~exist('S')
    S = zeros([size(M),0]);
  end
%
%  Find the first empty cell.
%
  firstId = min ( find ( M(:) == 0 ) );
%
%  If there aren't any zeros, then we have a solution.
%
  if isempty ( firstId )
    
    S(:,:,size(S,3)+1) = M;
%
%  Calculate the list of all numbers that can go into this first empty cell.
%
  else
    [i,j] = ind2sub ( [9,9], firstId );
    for k = 1 : 9  %loop through all 9 possibilities
      ii = (ceil(i/3)-1)*3+1;
      jj = (ceil(j/3)-1)*3+1;
      mm = M(ii:ii+2,jj:jj+2); %these are the indices into the 3x3 block containing that cell
%
%  If K doesn't appear in row I or column J or the block MM, set M(I,J) = K
%  and try to fill in another entry.
%
      if sum ( M(i,:) == k ) == 0 & sum ( M(:,j) == k ) == 0 & sum ( mm(:) == k ) == 0
        M(i,j) = k;
        S = sudoku_solve ( M, S );
      end
    end
  end

  return
end
