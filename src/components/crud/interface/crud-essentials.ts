export interface validator {
    isValid(): boolean;
    message: String;
}

export interface selectOption {
    value: String;
    label: String;
}

export interface fieldChange {
    new: String|Number;
    old: String|Number;
}

