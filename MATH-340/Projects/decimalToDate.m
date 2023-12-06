function dateString = decimalToDate(decimalYear)
    % Convert decimal year to date
    year = floor(decimalYear);
    fractionalYear = decimalYear - year;
    daysInYear = 365 + (rem(year, 400) == 0 || (rem(year, 4) == 0 && rem(year, 100) ~= 0)); % Leap year check
    dateNum = datenum(year, 1, 1) + round(fractionalYear * daysInYear) - 1;

    % Convert date number to date vector
    [year, month, day] = datevec(dateNum);

    % Create the date string in mm/dd/yyyy format
    dateString = sprintf('%02d/%02d/%04d', month, day, year);
end

% % Example Usage:
% decimalYear = 2021.1;
% dateStr = decimalToDate(decimalYear);
% disp(dateStr);
