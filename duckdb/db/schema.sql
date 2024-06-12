CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

--
-- Name: vssTxn; Type: TABLE;
--
CREATE TABLE vssTxn (
    uuid uuid DEFAULT uuid_generate_v4() NOT NULL,
    created_at timestamp without time zone DEFAULT (now() AT TIME ZONE 'utc'::text) NOT NULL,
    amount decimal NOT NULL,
    merchant varchar(255) NOT NULL,
    settlement_date date NOT NULL,
    purchase_date timestamp without time zone NOT NULL,
    currency char(3) NOT NULL,
    approval_number integer NOT NULL,
    int_fee decimal NOT NULL,
    merchant_country char(2) NOT NULL,
    type varchar(50) NOT NULL
);

--
-- Name: mqtTxn; Type: TABLE;
--
CREATE TABLE mqtTxn (
    batch_number varchar(255) NOT NULL,
    transaction_token varchar(255) NOT NULL,
    post_date timestamp without time zone NOT NULL,
    initiating_transaction_token varchar(255),
    reference_transaction_token varchar(255),
    reversal_transaction_token varchar(255),
    chargeback_token varchar(255),
    transaction_status varchar(255) NOT NULL,
    acting_user_token uuid NOT NULL,
    acting_card_token uuid NOT NULL,
    acting_card_last_four integer NOT NULL,
    merchant varchar(255) NOT NULL,
    network varchar(50) NOT NULL,
    merchant_category_code integer NOT NULL,
    currency char(3) NOT NULL,
    purchases decimal,
    returns decimal,
    interchange decimal,
    pin_debit_assoc_fees decimal,
    chargebacks decimal,
    baseDataId integer
);
