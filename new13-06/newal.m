baseDir = 'D:\DOC Aarabi\parkinson\new paper\ppmi_v2-20250523T075535Z-1-001\ppmi_v2';
dataDir = fullfile(baseDir, 'DATA');  % فولدر اصلی DATA
textDir = fullfile(dataDir, 'text');  % فولدر جدید برای ذخیره فایل‌ها

% بررسی و ساخت فولدر 'DATA' در صورت عدم وجود
if ~exist(dataDir, 'dir')
    mkdir(dataDir);
end

% بررسی و ساخت فولدر 'text' در صورت عدم وجود
if ~exist(textDir, 'dir')
    mkdir(textDir);
    disp('Folder "text" has been created.');
else
    disp('Folder "text" already exists.');
end

% استخراج فایل‌های سابجکت‌های سالم، بیمار، پرودرومال و سوئید
controlFiles = dir(fullfile(baseDir, 'ppmi', 'sub-control*', '*_schaefer100_correlation_matrix.mat'));
patientFiles = dir(fullfile(baseDir, 'ppmi', 'sub-patient*', '*_schaefer100_correlation_matrix.mat'));
prodromalFiles = dir(fullfile(baseDir, 'ppmi', 'sub-prodromal*', '*_schaefer100_correlation_matrix.mat'));
sweddFiles = dir(fullfile(baseDir, 'ppmi', 'sub-swedd*', '*_schaefer100_correlation_matrix.mat'));

% جدا کردن ماتریس برای گروه سالم
for i = 1:length(controlFiles)
    % بارگذاری داده‌ها برای هر فایل سابجکت سالم
    controlData = load(fullfile(controlFiles(i).folder, controlFiles(i).name));
    
    % بررسی وجود متغیر 'data' و استخراج ماتریس
    if isfield(controlData, 'data')
        controlCorrelation = controlData.data;
        
        % صفر کردن قطر اصلی ماتریس
        controlCorrelation = controlCorrelation - diag(diag(controlCorrelation)) + eye(size(controlCorrelation)) * 0;
        
        % استخراج نام سابجکت
        [~, subjectName, ~] = fileparts(controlFiles(i).name);  % استخراج نام سابجکت
        
        % ذخیره ماتریس مربوط به فرد سالم با نام فرد در فولدر text و پسوند .txt
        writematrix(controlCorrelation, fullfile(textDir, [subjectName '_schaefer100.txt']));
        disp(['Saved: ' subjectName '_schaefer100.txt']);
    else
        warning(['No field "data" found in ' controlFiles(i).name]);
    end
end

% جدا کردن ماتریس برای گروه بیمار
for i = 1:length(patientFiles)
    % بارگذاری داده‌ها برای هر فایل سابجکت بیمار
    patientData = load(fullfile(patientFiles(i).folder, patientFiles(i).name));
    
    % بررسی وجود متغیر 'data' و استخراج ماتریس
    if isfield(patientData, 'data')
        patientCorrelation = patientData.data;
        
        % صفر کردن قطر اصلی ماتریس
        patientCorrelation = patientCorrelation - diag(diag(patientCorrelation)) + eye(size(patientCorrelation)) * 0;
        
        % استخراج نام سابجکت
        [~, subjectName, ~] = fileparts(patientFiles(i).name);  % استخراج نام سابجکت
        
        % ذخیره ماتریس مربوط به فرد بیمار با نام فرد در فولدر text و پسوند .txt
        writematrix(patientCorrelation, fullfile(textDir, [subjectName '_schaefer100.txt']));
        disp(['Saved: ' subjectName '_schaefer100.txt']);
    else
        warning(['No field "data" found in ' patientFiles(i).name]);
    end
end

% جدا کردن ماتریس برای گروه پرودرومال
for i = 1:length(prodromalFiles)
    % بارگذاری داده‌ها برای هر فایل سابجکت پرودرومال
    prodromalData = load(fullfile(prodromalFiles(i).folder, prodromalFiles(i).name));
    
    % بررسی وجود متغیر 'data' و استخراج ماتریس
    if isfield(prodromalData, 'data')
        prodromalCorrelation = prodromalData.data;
        
        % صفر کردن قطر اصلی ماتریس
        prodromalCorrelation = prodromalCorrelation - diag(diag(prodromalCorrelation)) + eye(size(prodromalCorrelation)) * 0;
        
        % استخراج نام سابجکت
        [~, subjectName, ~] = fileparts(prodromalFiles(i).name);  % استخراج نام سابجکت
        
        % ذخیره ماتریس مربوط به فرد پرودرومال با نام فرد در فولدر text و پسوند .txt
        writematrix(prodromalCorrelation, fullfile(textDir, [subjectName '_schaefer100.txt']));
        disp(['Saved: ' subjectName '_schaefer100.txt']);
    else
        warning(['No field "data" found in ' prodromalFiles(i).name]);
    end
end

% جدا کردن ماتریس برای گروه سوئید
for i = 1:length(sweddFiles)
    % بارگذاری داده‌ها برای هر فایل سابجکت سوئید
    sweddData = load(fullfile(sweddFiles(i).folder, sweddFiles(i).name));
    
    % بررسی وجود متغیر 'data' و استخراج ماتریس
    if isfield(sweddData, 'data')
        sweddCorrelation = sweddData.data;
        
        % صفر کردن قطر اصلی ماتریس
        sweddCorrelation = sweddCorrelation - diag(diag(sweddCorrelation)) + eye(size(sweddCorrelation)) * 0;
        
        % استخراج نام سابجکت
        [~, subjectName, ~] = fileparts(sweddFiles(i).name);  % استخراج نام سابجکت
        
        % ذخیره ماتریس مربوط به فرد سوئید با نام فرد در فولدر text و پسوند .txt
        writematrix(sweddCorrelation, fullfile(textDir, [subjectName '_schaefer100.txt']));
        disp(['Saved: ' subjectName '_schaefer100.txt']);
    else
        warning(['No field "data" found in ' sweddFiles(i).name]);
    end
end
