CREATE TABLE `movements` (
	`id` text PRIMARY KEY NOT NULL,
	`user_id` text NOT NULL,
	`sku` text NOT NULL,
	`delta` integer NOT NULL,
	`kind` text NOT NULL,
	`reference` text NOT NULL,
	`note` text DEFAULT '' NOT NULL,
	`created_at` text NOT NULL
);
--> statement-breakpoint
CREATE TABLE `orders` (
	`user_id` text NOT NULL,
	`channel` text NOT NULL,
	`order_id` text NOT NULL,
	`line_id` text NOT NULL,
	`sku` text NOT NULL,
	`quantity` integer NOT NULL,
	`status` text NOT NULL,
	`ordered_at` text NOT NULL,
	`gross` integer DEFAULT 0 NOT NULL,
	`discount` integer DEFAULT 0 NOT NULL,
	`shipping_income` integer DEFAULT 0 NOT NULL,
	`refund` integer DEFAULT 0 NOT NULL,
	`platform_fee` integer DEFAULT 0 NOT NULL,
	`transaction_fee` integer DEFAULT 0 NOT NULL,
	`affiliate_fee` integer DEFAULT 0 NOT NULL,
	`seller_shipping` integer DEFAULT 0 NOT NULL,
	`ad_cost` integer DEFAULT 0 NOT NULL,
	`other_fee` integer DEFAULT 0 NOT NULL,
	`unit_cost` integer DEFAULT 0 NOT NULL,
	`fees_complete` integer DEFAULT 0 NOT NULL,
	`updated_at` text NOT NULL,
	PRIMARY KEY(`user_id`, `channel`, `order_id`, `line_id`)
);
--> statement-breakpoint
CREATE TABLE `products` (
	`user_id` text NOT NULL,
	`sku` text NOT NULL,
	`name` text NOT NULL,
	`unit_cost` integer DEFAULT 0 NOT NULL,
	`reorder_point` integer DEFAULT 0 NOT NULL,
	`created_at` text NOT NULL,
	PRIMARY KEY(`user_id`, `sku`)
);
