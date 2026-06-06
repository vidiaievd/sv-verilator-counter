module counter (
    input  logic clk,
    input  logic rst,
    input  logic enable,
    output logic [7:0] count,
    output logic overflow,
    output logic [1:0] state
);

    // FSM states
    typedef enum logic [1:0] {
        IDLE = 2'b00,
        RUN  = 2'b01,
        STOP = 2'b10
    } state_t;

    state_t current_state;

    logic [7:0] internal;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            current_state <= IDLE;
            internal      <= 8'd0;
            overflow      <= 1'b0;
        end else begin
            case (current_state)

                IDLE: begin
                    overflow <= 1'b0;

                    if (enable)
                        current_state <= RUN;
                end

                RUN: begin
                    if (enable) begin
                        internal <= internal + 1;

                        if (internal == 8'hFF)
                            overflow <= 1'b1;
                    end else begin
                        current_state <= STOP;
                    end
                end

                STOP: begin
                    if (enable)
                        current_state <= RUN;
                end

                default: begin
                    current_state <= IDLE;
                    internal      <= 8'd0;
                    overflow      <= 1'b0;
                end

            endcase
        end
    end

    // outputs
    assign count = internal;
    assign state = current_state;

endmodule
