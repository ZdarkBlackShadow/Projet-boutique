const HardwareData = require('../data/hardware.json');

exports.GetAllHardwareData = (req, res) => {
    const hardwares = HardwareData.hardwares;
    res.json(hardwares);
};

exports.GetHardwareById = (req, res) => {
    const id = parseInt(req.params.id);

    const hardwares = HardwareData.hardwares;
    const hardware = hardwares.find((hardware) => hardware.id === id);

    if (!hardware) {
        return res.status(404).json({
            message : "hardware not found"
        });
    }

    res.status(200).json({
        message:"hardware found",
        hardware
    });
}